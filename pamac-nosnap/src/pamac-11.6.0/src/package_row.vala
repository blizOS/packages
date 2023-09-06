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

	[GtkTemplate (ui = "/org/manjaro/pamac/manager/package_row.ui")]
	public class PackageRow : Gtk.FlowBoxChild {

		[GtkChild]
		public unowned Gtk.Image app_icon;
		[GtkChild]
		public unowned Gtk.Label name_label;
		[GtkChild]
		public unowned Gtk.Label desc_label;
		[GtkChild]
		public unowned Gtk.Label old_version_label;
		[GtkChild]
		public unowned Gtk.Label version_label;
		[GtkChild]
		public unowned Gtk.Label repo_label;
		[GtkChild]
		public unowned Gtk.Label size_label;
		[GtkChild]
		public unowned Gtk.ToggleButton action_togglebutton;
		[GtkChild]
		public unowned Gtk.Image action_icon;

		public Package? pkg;

		public PackageRow (Package? pkg, bool mobile) {
			this.pkg = pkg;
			if (mobile) {
				desc_label.width_chars = -1;
				version_label.ellipsize = Pango.EllipsizeMode.END;
				old_version_label.ellipsize = Pango.EllipsizeMode.END;
			}
		}

	}

}
