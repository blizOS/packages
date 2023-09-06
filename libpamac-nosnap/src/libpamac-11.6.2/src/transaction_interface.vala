/*
 *  pamac-vala
 *
 *  Copyright (C) 2018-2023 Guillaume Benoit <guillaume@manjaro.org>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a get of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Pamac {
	internal interface TransactionInterface : Object {
		public abstract async bool get_authorization () throws Error;
		public abstract void remove_authorization () throws Error;
		public abstract async void generate_mirrors_list (string country) throws Error;
		public abstract async bool clean_cache (GenericArray<string> filenames) throws Error;
		public abstract async bool clean_build_files (string aur_build_dir) throws Error;
		public abstract async bool set_pkgreason (string pkgname, uint reason) throws Error;
		public abstract async bool download_updates () throws Error;
		public abstract async bool trans_refresh (bool force) throws Error;
		public abstract async bool trans_run (bool sysupgrade,
										bool enable_downgrade,
										bool simple_install,
										bool keep_built_pkgs,
										int trans_flags,
										GenericArray<string> to_install,
										GenericArray<string> to_remove,
										GenericArray<string> to_load,
										GenericArray<string> to_install_as_dep,
										GenericArray<string> ignorepkgs,
										GenericArray<string> overwrite_files) throws Error;
		public abstract void trans_cancel () throws Error;
		public abstract void quit_daemon () throws Error;
		public signal void emit_action (string action);
		public signal void emit_action_progress (string action, string status, double progress);
		public signal void start_downloading ();
		public signal void stop_downloading ();
		public signal void start_waiting ();
		public signal void stop_waiting ();
		public signal void emit_download_progress (string action, string status, double progress);
		public signal void emit_hook_progress (string action, string details, string status, double progress);
		public signal void emit_script_output (string message);
		public signal void emit_warning (string message);
		public signal void emit_error (string message, GenericArray<string> details);
		public signal void important_details_outpout (bool must_show);
		public signal void generate_mirrors_list_data (string line);
		public abstract async bool snap_trans_run (GenericArray<string> to_install, GenericArray<string> to_remove) throws Error;
		public abstract async bool snap_switch_channel (string snap_name, string channel) throws Error;
		public abstract async bool flatpak_trans_run (GenericArray<string> to_install, GenericArray<string> to_remove, GenericArray<string> to_upgrade) throws Error;
	}
}
