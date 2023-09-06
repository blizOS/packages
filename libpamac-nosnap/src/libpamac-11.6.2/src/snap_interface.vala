/*
 *  pamac-vala
 *
 *  Copyright (C) 2019-2023 Guillaume Benoit <guillaume@manjaro.org>
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
	internal interface SnapPlugin : Object {
		public signal bool get_authorization (string sender);
		public signal void emit_action_progress (string sender, string action, string status, double progress);
		public signal void emit_download_progress (string sender, string action, string status, double progress);
		public signal void emit_script_output (string sender, string message);
		public signal void emit_error (string sender, string message, string[] details);
		public signal void start_downloading (string sender);
		public signal void stop_downloading (string sender);

		public abstract void search_snaps (string search_string, ref GenericArray<unowned SnapPackage> pkgs);
		public abstract void search_uninstalled_snaps_sync (string search_string, ref GenericArray<unowned SnapPackage> pkgs);
		public abstract bool is_installed_snap (string name);
		public abstract unowned SnapPackage? get_snap (string name);
		public abstract unowned SnapPackage? get_snap_by_app_id (string app_id);
		public abstract void get_installed_snaps (ref GenericArray<unowned SnapPackage> pkgs);
		public abstract string get_installed_snap_icon (string name) throws Error;
		public abstract void get_category_snaps (string category, ref GenericArray<unowned SnapPackage> pkgs);
		public abstract bool trans_run (string sender, string[] to_install, string[] to_remove);
		public abstract bool switch_channel (string sender, string name, string channel);
		public abstract void trans_cancel (string sender);
		public abstract void refresh ();
	}

	public abstract class SnapPackage : Package {
		public abstract string? channel { get; }
		public abstract string? publisher { get; }
		public abstract string? confined { get; }
		public abstract GenericArray<string> channels { get; }

		internal SnapPackage () {}
	}
}
