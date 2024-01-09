namespace GOpenHMD {
    public class Context : Object {
		public Context() throws Error {
			Object();
			this.ensure_constructed();
		}

		construct {
			this.ctx = ohmd.ctx_create();
			debug(@"Context is created: '$((uint)this.ctx)'");
		}

		~Context() {
			if (this.ctx != null) {
				debug(@"Destroy context: '$((uint)this.ctx)'");
				ohmd.ctx_destroy(this.ctx);
				debug("Context is destroyed");
			}
		}

		// Public properties

		public unowned string? error {
			get { return this._get_error(); }
		}

		public int number_of_devices {
			get { return this._probe(); }
		}

		// Public methods

		public void ensure_constructed() throws Error  {
			if (this.ctx == null) {
				throw new Error.CONTEXT_CREATE_FAIL(
					this.error ?? "Failed to allocate an ohmd_context pointer"
				);
			}
		}
		
		public void update() {
			ohmd.ctx_update(this.ctx);
		}

        public DeviceDescription[] enumerate() {
            DeviceDescription[] ret = {};

			var ndevs = this.number_of_devices;

            for (int i = 0; i < ndevs; i++){
                ret += new DeviceDescription(this, i);
            }

            return ret;
        }

		public Device open_device(int index, DeviceSettings? settings = null) throws Error{
			//  TODO
			//  var s = (ohmd._device_settings)settings;
			//  ohmd._device p;
			//  (settings == null) ? p = ohmd.list_open_device(this.ctx, index)
			//  				   : p = ohmd.list_open_device_s(this.ctx, index, s);
			unowned var? p = ohmd.list_open_device(this.ctx, index);

			if (p == null) {
				throw new Error.DEVICE_OPEN_FAIL(
					this.error ?? @"Failed to open device with index='$(index)'"
				);
			}
			var dev_ptr = DevicePtr((int*)&p);
			var dev = new Device(dev_ptr, settings);
			
			return dev;
		}
		
		public unowned string list_gets(int index, DeviceDescriptionStringValue type) {
            var t = (ohmd._string_value) type;
            unowned var s = ohmd.list_gets(this.ctx, index, t);
			return s;
		}

        public int list_geti(int index, DeviceDescriptionIntValue type) throws Error {
            var t = (ohmd._int_value) type;
            int o[16];
            int ret = ohmd.list_geti(this.ctx, index, t, o);

            if (ret < 0) {
                throw new Error.INT_VALUE_GET_FAIL(
                    this.error ?? "Can not retrieve int value"
                );
			}

            return o[0];
        }

		// Private properties

		private unowned ohmd._context? ctx;

		// Private methods

		private unowned string? _get_error() {
			unowned var error = ohmd.ctx_get_error(this.ctx);

            if (error == "") { return null; }

			return error;
		}

		private int _probe() {
			debug("Probe devices...");
			var number_of_devices = ohmd.ctx_probe(this.ctx);
			debug(@"Discovered '$(number_of_devices)' devices");
			return number_of_devices;
		}
	}
}