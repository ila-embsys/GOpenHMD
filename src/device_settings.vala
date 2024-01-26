namespace GOpenHMD {

    public enum IntSettings {
        IDS_AUTOMATIC_UPDATE = 0,
    }

    public struct DeviceSettingsHandle {
        public DeviceSettingsHandle (int* ptr) {
            this.ptr = ptr;
        }

        public int* ptr;
    }

    public class DeviceSettings : Object {
        construct {
            this.settings = ohmd.device_settings_create (
                (ohmd._context)this.context.handle.ptr
            );
            debug (@"Device settings is created: '$((uint)this.settings)'");
            this.handle = DeviceSettingsHandle ((int*)this.settings);
        }

        public DeviceSettings (Context ctx) throws Error {
            Object (context: ctx);
            this.ensure_constructed ();
        }

        ~DeviceSettings () {
            debug (@"Destroy device settings: '$((uint)this.settings)'");
            ohmd.device_settings_destroy (this.settings);
            debug ("Device settings is destroyed");
        }

        public void set_automatic_update (bool state) throws Error {
            int s = state ? 1 : 0;
            var ret = ohmd.device_settings_seti (
                this.settings,
                ohmd._int_settings.IDS_AUTOMATIC_UPDATE,
                &s
            );

            if (ret != ohmd._status.OK) {
                throw new Error.INT_SETTINGS_SET_FAIL ("Error get setting");
            };
        }

        public void ensure_constructed () throws Error {
            if (this.settings == null) {
                throw new Error.DEVICE_SETTINGS_CREATE_FAIL (
                    "Failed to allocate device settings"
                );
            }
        }

        public DeviceSettingsHandle handle;
        public Context context { get; construct; }
        private unowned ohmd._device_settings? settings;
    }

}