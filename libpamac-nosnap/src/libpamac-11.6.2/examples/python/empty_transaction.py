#!/usr/bin/python

import gi
gi.require_version('Pamac', '11')
from gi.repository import GLib, Pamac

def on_emit_action(transaction, action, data):
	print(action)

def on_emit_action_progress(transaction, action, status, progress, data):
	print(f"{action} {status} {progress}")

def on_emit_hook_progress(transaction, action, details, status, progress, data):
	print(f"{action} {details} {status} {progress}")

def on_emit_warning(transaction, message, data):
	print(message)

def on_emit_error(transaction, message, details, data):
	if len(details) > 0:
		print(f"{message}:")
		for detail in details:
			print(detail)
	else:
		print(message)

def on_transaction_finished_callback(source_object, result, user_data):
	try:
		success = source_object.run_finish(result)
	except GLib.GError as e:
		print("Error: ", e.message)
	else:
		print("Success :", success)
	finally:
		loop.quit()
		transaction.quit_daemon()

def run_transaction():
	# /!\ the transaction will run without confirmation /!\
	# you need to override Transaction.ask_confirmation() method
	# in order to implement your own confirmation step
	transaction.add_pkg_to_install("pkgname")
	transaction.run_async(on_transaction_finished_callback, None)
	# launch a loop to wait for the callback to be called
	loop.run()

if __name__ == "__main__":
	loop = GLib.MainLoop()
	config = Pamac.Config(conf_path="/etc/pamac.conf")
	db = Pamac.Database(config=config)
	transaction = Pamac.Transaction(database=db)
	data = None
	transaction.connect ("emit-action", on_emit_action, data)
	transaction.connect ("emit-action-progress", on_emit_action_progress, data)
	transaction.connect ("emit-hook-progress", on_emit_hook_progress, data)
	transaction.connect ("emit-error", on_emit_error, data)
	transaction.connect ("emit-warning", on_emit_warning, data)
	run_transaction()
