namespace GOpenHMD {
    public class DeviceSettings : Object {

    }

    public struct DevicePtr { 
        public DevicePtr(int* ptr) {
            this.ptr = ptr;
        }
        
        public int* ptr;
    }

    public class Device : Object,
        IGetFloat<FloatValue>,
        ISetFloat<FloatValue>,
        IGetInteger<DeviceDescriptionIntValue>,
        ISetInteger<DeviceDescriptionIntValue>,
        ISetData<DataValue, void*> {
        public Device(DevicePtr dev_ptr, DeviceSettings? settings) {
            Object(settings: settings, dev_ptr: dev_ptr);
        }

        construct {
            this.dev = (ohmd._device)this.dev_ptr.ptr;
            debug(@"Device was opened: '$((uint)this.dev)'");
        }

        ~Device() {
            if (this.dev != null) {
                debug ("Destroy device object,"
                + " but leave its handle opened due to"
                + " original code examples behaviour."
                + " Otherwise, it segfaults."
                + " Device handles will be closed on context destroying");
                //  debug (@"Close device: '$((uint)this.dev)'");
                //  ohmd.close_device(this.dev);
                //  debug("Device is closed"); 
            }
        }

        // Public methods

        public float get_float (GOpenHMD.FloatValue type) throws Error {
            debug(@"Request float of type $(type)");
            var t = (ohmd._float_value)type;
            float val[16];
            var ret = ohmd.device_getf (this.dev, t, val);

            if (ret < 0) {
                throw new Error.FLOAT_VALUE_GET_FAIL(
                    @"Error retrieving integer value: ret = '$(ret)'"
                );
            }
            
            return (float)val[0];
        }

        public void set_float (GOpenHMD.FloatValue type, float value) throws Error {
            var t = (ohmd._float_value)type;
            var ret = ohmd.device_setf (this.dev, t, ref value);

            if (ret < 0) {
                throw new Error.FLOAT_VALUE_SET_FAIL(
                    @"Error setting integer value: ret = '$(ret)'"
                );
            }
        } 

        public void set_dat (GOpenHMD.DataValue type, void* val) throws Error {
            var t = (ohmd._data_value)type;
            var ret = ohmd.device_set_data (this.dev, t, val);

            if (ret < 0) {
                throw new Error.DATA_VALUE_SET_FAIL(
                    @"Error setting integer value: ret = '$(ret)'"
                );
            }
        }

        public void set_int (GOpenHMD.DeviceDescriptionIntValue type, int value) throws Error {
            var t = (ohmd._int_value)type;
            var ret = ohmd.device_seti (this.dev, t, value);

            if (ret < 0) {
                throw new Error.INT_VALUE_SET_FAIL(
                    @"Error setting integer value: ret = '$(ret)'"
                );
            }
        }

        public int get_int (GOpenHMD.DeviceDescriptionIntValue type) throws Error {
            debug(@"Request integer of type $(type)");
            var t = (ohmd._int_value)type;
            int val[16];
            var ret = ohmd.device_geti (this.dev, t, val);
            
            if (ret < 0) {
                throw new Error.INT_VALUE_GET_FAIL(
                    @"Error getting integer value: ret = '$(ret)'"
                );
            }
            
            return val[0];
        }


        // Private properties

        public DeviceSettings? settings { get; construct; }
        public DevicePtr dev_ptr { get; construct; }
        private unowned ohmd._device dev;
    }
}
