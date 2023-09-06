/* pamac.vapi generated by valac 0.56.13, do not modify. */

[CCode (gir_namespace = "Pamac", gir_version = "11")]
namespace Pamac {
	[CCode (cheader_filename = "pamac.h")]
	public abstract class AURPackage : Pamac.AlpmPackage {
		public abstract GLib.DateTime? firstsubmitted { get; }
		public abstract GLib.DateTime? lastmodified { get; }
		public abstract string? maintainer { get; }
		public abstract uint64 numvotes { get; }
		public abstract GLib.DateTime? outofdate { get; }
		public abstract string? packagebase { get; internal set; }
		public abstract double popularity { get; }
	}
	[CCode (cheader_filename = "pamac.h")]
	public abstract class AlpmPackage : Pamac.Package {
		public abstract unowned GLib.GenericArray<string> get_files ();
		public abstract async unowned GLib.GenericArray<string> get_files_async ();
		public abstract GLib.GenericArray<string> backups { get; }
		public abstract GLib.DateTime? build_date { get; }
		public abstract GLib.GenericArray<string> checkdepends { get; }
		public abstract GLib.GenericArray<string> conflicts { get; internal set; }
		public abstract GLib.GenericArray<string> depends { get; internal set; }
		public abstract GLib.GenericArray<string> groups { get; }
		public abstract GLib.GenericArray<string> makedepends { get; }
		public abstract GLib.GenericArray<string> optdepends { get; }
		public abstract GLib.GenericArray<string> optionalfor { get; }
		public abstract string? packager { get; }
		public abstract GLib.GenericArray<string> provides { get; internal set; }
		public abstract string? reason { get; }
		public abstract GLib.GenericArray<string> replaces { get; internal set; }
		public abstract GLib.GenericArray<string> requiredby { get; }
		public abstract GLib.GenericArray<string> validations { get; }
	}
	[CCode (cheader_filename = "pamac.h")]
	public class Config : GLib.Object {
		public Config (string conf_path);
		public void add_ignorepkg (string name);
		public void reload ();
		public void remove_ignorepkg (string name);
		public void save ();
		public string aur_build_dir { get; set; }
		public bool check_aur_updates { get; set; }
		public bool check_aur_vcs_updates { get; set; }
		public bool check_flatpak_updates { get; set; }
		public bool checkspace { get; set; }
		public uint64 clean_keep_num_pkgs { get; set; }
		public bool clean_rm_only_uninstalled { get; set; }
		public string conf_path { get; construct; }
		public string db_path { get; }
		public bool download_updates { get; set; }
		public bool enable_appstream { get; set; }
		public bool enable_aur { get; set; }
		public bool enable_downgrade { get; set; }
		public bool enable_flatpak { get; set; }
		public bool enable_snap { get; set; }
		public GLib.HashTable<string,string> environment_variables { get; }
		public GLib.GenericSet<string?> ignorepkgs { get; }
		public bool keep_built_pkgs { get; set; }
		public uint64 max_parallel_downloads { get; set; }
		public bool no_update_hide_icon { get; set; }
		public bool offline_upgrade { get; set; }
		public bool recurse { get; set; }
		public uint64 refresh_period { get; set; }
		public bool simple_install { get; set; }
		public bool support_appstream { get; private set; }
		public bool support_aur { get; private set; }
		public bool support_flatpak { get; set; }
		public bool support_snap { get; private set; }
	}
	[CCode (cheader_filename = "pamac.h")]
	public class Database : GLib.Object {
		public GLib.CompareFunc<string> vercmp;
		public Database (Pamac.Config config);
		public GLib.File? clone_build_files (string pkgname, bool overwrite_files, GLib.Cancellable? cancellable = null);
		public async GLib.File? clone_build_files_async (string pkgname, bool overwrite_files, GLib.Cancellable? cancellable = null);
		public string get_alpm_dep_name (string dep_string);
		public unowned Pamac.Package? get_app_by_id (string app_id);
		public unowned Pamac.AURPackage? get_aur_pkg (string pkgname);
		public async unowned Pamac.AURPackage? get_aur_pkg_async (string pkgname);
		public GLib.HashTable<string,weak Pamac.AURPackage?> get_aur_pkgs (GLib.GenericArray<string> pkgnames);
		public async GLib.HashTable<string,weak Pamac.AURPackage?> get_aur_pkgs_async (GLib.GenericArray<string> pkgnames);
		public GLib.HashTable<string,uint64?> get_build_files_details ();
		public async GLib.HashTable<string,uint64?> get_build_files_details_async ();
		public unowned GLib.GenericArray<string> get_categories_names ();
		public async GLib.GenericArray<weak Pamac.FlatpakPackage> get_category_flatpaks_async (string category);
		public async GLib.GenericArray<weak Pamac.AlpmPackage> get_category_pkgs_async (string category);
		public async GLib.GenericArray<weak Pamac.SnapPackage> get_category_snaps_async (string category);
		public GLib.HashTable<string,uint64?> get_clean_cache_details ();
		public async GLib.HashTable<string,uint64?> get_clean_cache_details_async ();
		public GLib.GenericArray<weak Pamac.AlpmPackage> get_explicitly_installed_pkgs ();
		public async GLib.GenericArray<weak Pamac.AlpmPackage> get_explicitly_installed_pkgs_async ();
		public async unowned Pamac.FlatpakPackage? get_flatpak_async (string id);
		public GLib.GenericArray<weak string> get_flatpak_remotes_names ();
		public GLib.GenericArray<weak Pamac.AlpmPackage> get_foreign_pkgs ();
		public async GLib.GenericArray<weak Pamac.AlpmPackage> get_foreign_pkgs_async ();
		public GLib.GenericArray<weak Pamac.AlpmPackage> get_group_pkgs (string group_name);
		public async GLib.GenericArray<weak Pamac.AlpmPackage> get_group_pkgs_async (string group_name);
		public unowned GLib.GenericArray<string> get_groups_names ();
		public async GLib.GenericArray<weak Pamac.AlpmPackage> get_installed_apps_async ();
		public async GLib.GenericArray<weak Pamac.FlatpakPackage> get_installed_flatpaks_async ();
		public unowned Pamac.AlpmPackage? get_installed_pkg (string pkgname);
		public GLib.GenericArray<weak Pamac.AlpmPackage> get_installed_pkgs ();
		public async GLib.GenericArray<weak Pamac.AlpmPackage> get_installed_pkgs_async ();
		public GLib.GenericArray<weak Pamac.AlpmPackage> get_installed_pkgs_by_glob (string glob);
		public unowned Pamac.AlpmPackage? get_installed_satisfier (string depstring);
		public async string get_installed_snap_icon_async (string name);
		public async GLib.GenericArray<weak Pamac.SnapPackage> get_installed_snaps_async ();
		public GLib.DateTime? get_last_refresh_time ();
		public async unowned string get_mirrors_choosen_country_async ();
		public async unowned GLib.GenericArray<string> get_mirrors_countries_async ();
		public GLib.GenericArray<weak Pamac.AlpmPackage> get_orphans ();
		public async GLib.GenericArray<weak Pamac.AlpmPackage> get_orphans_async ();
		public unowned Pamac.AlpmPackage? get_pkg (string pkgname);
		public GLib.GenericArray<weak Pamac.AlpmPackage> get_repo_pkgs (string repo);
		public async GLib.GenericArray<weak Pamac.AlpmPackage> get_repo_pkgs_async (string repo);
		public unowned GLib.GenericArray<string> get_repos_names ();
		public async unowned Pamac.SnapPackage? get_snap_async (string name);
		public unowned Pamac.AlpmPackage? get_sync_pkg (string pkgname);
		public GLib.GenericArray<weak Pamac.AlpmPackage> get_sync_pkgs_by_glob (string glob);
		public unowned Pamac.AlpmPackage? get_sync_satisfier (string depstring);
		public Pamac.Updates get_updates (bool use_timestamp);
		public async Pamac.Updates get_updates_async (bool use_timestamp);
		public async GLib.InputStream get_url_stream (string url) throws GLib.Error;
		public bool has_installed_satisfier (string depstring);
		public bool has_sync_satisfier (string depstring);
		public bool is_installed_flatpak (string name);
		public bool is_installed_pkg (string pkgname);
		public bool is_installed_snap (string name);
		public bool is_sync_pkg (string pkgname);
		public bool need_refresh ();
		public void refresh ();
		public void refresh_flatpak_appstream_data ();
		public async void refresh_flatpak_appstream_data_async ();
		public void refresh_tmp_files_dbs ();
		public async void refresh_tmp_files_dbs_async ();
		public bool regenerate_srcinfo (string pkgname, GLib.Cancellable? cancellable = null);
		public async bool regenerate_srcinfo_async (string pkgname, GLib.Cancellable? cancellable = null);
		public GLib.GenericArray<weak Pamac.AURPackage> search_aur_pkgs (string search_string);
		public async GLib.GenericArray<weak Pamac.AURPackage> search_aur_pkgs_async (string search_string);
		public GLib.HashTable<string,GLib.GenericArray<string>> search_files (GLib.GenericArray<string> files);
		public async GLib.GenericArray<weak Pamac.FlatpakPackage> search_flatpaks_async (string search_string);
		public GLib.GenericArray<weak Pamac.AlpmPackage> search_installed_pkgs (string search_string);
		public async GLib.GenericArray<weak Pamac.AlpmPackage> search_installed_pkgs_async (string search_string);
		public GLib.GenericArray<weak Pamac.AlpmPackage> search_pkgs (string search_string);
		public async GLib.GenericArray<weak Pamac.AlpmPackage> search_pkgs_async (string search_string);
		public GLib.GenericArray<weak Pamac.AlpmPackage> search_repos_pkgs (string search_string);
		public async GLib.GenericArray<weak Pamac.AlpmPackage> search_repos_pkgs_async (string search_string);
		public async GLib.GenericArray<weak Pamac.SnapPackage> search_snaps_async (string search_string);
		public GLib.GenericArray<weak Pamac.AlpmPackage> search_uninstalled_apps (GLib.GenericArray<string> search_terms);
		public bool should_hold (string pkgname);
		public Pamac.Config config { get; set construct; }
		public signal void emit_warning (string message);
		public signal void get_updates_progress (uint percent);
	}
	[CCode (cheader_filename = "pamac.h")]
	public abstract class FlatpakPackage : Pamac.Package {
	}
	[CCode (cheader_filename = "pamac.h")]
	public abstract class Package : GLib.Object {
		public abstract string? app_id { get; }
		public abstract string? app_name { get; }
		public abstract string? desc { get; internal set; }
		public abstract uint64 download_size { get; }
		public abstract string? icon { get; }
		public abstract string id { get; internal set; }
		public abstract GLib.DateTime? install_date { get; }
		public abstract uint64 installed_size { get; }
		public abstract string? installed_version { get; internal set; }
		public abstract string? launchable { get; }
		public abstract string? license { get; }
		public abstract string? long_desc { get; }
		public abstract string name { get; internal set; }
		public abstract string? repo { get; internal set; }
		public abstract GLib.GenericArray<string> screenshots { get; }
		public abstract string? url { get; }
		public abstract string version { get; internal set; }
	}
	[CCode (cheader_filename = "pamac.h")]
	public abstract class SnapPackage : Pamac.Package {
		public abstract string? channel { get; }
		public abstract GLib.GenericArray<string> channels { get; }
		public abstract string? confined { get; }
		public abstract string? publisher { get; }
	}
	[CCode (cheader_filename = "pamac.h")]
	public class Transaction : GLib.Object {
		public Transaction (Pamac.Database database);
		public void add_flatpak_to_install (Pamac.FlatpakPackage pkg);
		public void add_flatpak_to_remove (Pamac.FlatpakPackage pkg);
		public void add_flatpak_to_upgrade (Pamac.FlatpakPackage pkg);
		public void add_overwrite_file (string glob);
		public void add_path_to_load (string path);
		public void add_pkg_to_build (string name, bool clone_build_files, bool clone_deps_build_files);
		public void add_pkg_to_install (string name);
		public void add_pkg_to_mark_as_dep (string name);
		public void add_pkg_to_remove (string name);
		public void add_pkgs_to_upgrade (bool force_refresh);
		public void add_snap_to_install (Pamac.SnapPackage pkg);
		public void add_snap_to_remove (Pamac.SnapPackage pkg);
		public void add_temporary_ignore_pkg (string name);
		protected virtual async bool ask_commit (Pamac.TransactionSummary summary);
		protected virtual async bool ask_edit_build_files (Pamac.TransactionSummary summary);
		protected virtual async bool ask_import_key (string pkgname, string key, string? owner);
		protected virtual async bool ask_snap_install_classic (string name);
		public void cancel ();
		public async void check_dbs ();
		protected virtual async GLib.GenericArray<string> choose_optdeps (string pkgname, GLib.GenericArray<string> optdeps);
		protected virtual async int choose_provider (string depend, GLib.GenericArray<string> providers);
		public async void clean_build_files_async ();
		public async void clean_cache_async ();
		public async bool download_updates_async ();
		protected virtual async void edit_build_files (GLib.GenericArray<string> pkgnames);
		public async void generate_mirrors_list_async (string country);
		public async bool get_authorization_async ();
		protected async GLib.GenericArray<string> get_build_files_async (string pkgname);
		public void quit_daemon ();
		public void remove_authorization ();
		public async bool run_async ();
		public virtual async int run_cmd_line_async (GLib.GenericArray<string> args, string? working_directory, GLib.Cancellable cancellable);
		public async bool set_pkgreason_async (string pkgname, uint reason);
		public async bool snap_switch_channel_async (string snap_name, string channel);
		public bool cascade { get; set; }
		public Pamac.Database database { get; set construct; }
		public bool download_only { get; set; }
		public bool dry_run { get; set; }
		public bool install_as_dep { get; set; }
		public bool install_as_explicit { get; set; }
		public bool install_if_needed { get; set; }
		public bool keep_config_files { get; set; }
		public bool no_refresh { get; set; }
		public bool remove_if_unneeded { get; set; }
		public signal void emit_action (string action);
		public signal void emit_action_progress (string action, string status, double progress);
		public signal void emit_download_progress (string action, string status, double progress);
		public signal void emit_error (string message, GLib.GenericArray<string> details);
		public signal void emit_hook_progress (string action, string details, string status, double progress);
		public signal void emit_script_output (string message);
		public signal void emit_warning (string message);
		public signal void important_details_outpout (bool must_show);
		public signal void start_building ();
		public signal void start_downloading ();
		public signal void start_preparing ();
		public signal void start_waiting ();
		public signal void stop_building ();
		public signal void stop_downloading ();
		public signal void stop_preparing ();
		public signal void stop_waiting ();
	}
	[CCode (cheader_filename = "pamac.h")]
	public class TransactionSummary : GLib.Object {
		public GLib.GenericArray<string> aur_pkgbases_to_build { internal get; internal set; }
		public GLib.GenericArray<Pamac.Package> conflicts_to_remove { get; internal set; }
		public GLib.GenericArray<Pamac.Package> to_build { get; internal set; }
		public GLib.GenericArray<Pamac.Package> to_downgrade { get; internal set; }
		public GLib.GenericArray<Pamac.Package> to_install { get; internal set; }
		public GLib.GenericArray<string> to_load { internal get; internal set; }
		public GLib.GenericArray<Pamac.Package> to_reinstall { get; internal set; }
		public GLib.GenericArray<Pamac.Package> to_remove { get; internal set; }
		public GLib.GenericArray<Pamac.Package> to_upgrade { get; internal set; }
	}
	[CCode (cheader_filename = "pamac.h")]
	public class Updates : GLib.Object {
		public GLib.GenericArray<Pamac.AURPackage> aur_updates { get; internal set; }
		public GLib.GenericArray<Pamac.FlatpakPackage> flatpak_updates { get; internal set; }
		public GLib.GenericArray<Pamac.AURPackage> ignored_aur_updates { get; internal set; }
		public GLib.GenericArray<Pamac.AlpmPackage> ignored_repos_updates { get; internal set; }
		public GLib.GenericArray<Pamac.AURPackage> outofdate { get; internal set; }
		public GLib.GenericArray<Pamac.AlpmPackage> repos_updates { get; internal set; }
	}
	[CCode (cheader_filename = "pamac.h")]
	public class UpdatesChecker : GLib.Object {
		public UpdatesChecker ();
		public void check_updates ();
		public bool no_update_hide_icon { get; }
		public uint64 refresh_period { get; }
		public string[] updates_list { get; }
		public uint16 updates_nb { get; }
		public signal void updates_available (uint16 updates_nb);
	}
	[CCode (cheader_filename = "pamac.h")]
	public static string get_version ();
}
