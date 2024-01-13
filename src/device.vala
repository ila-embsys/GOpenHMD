namespace GOpenHMD {
    public class DeviceSettings : Object {

    }

    public class Device : Object, IDevice {

        public int screen_horizontal_resolution () throws Error {
            return this.get_int (
                DeviceDescriptionIntValue.SCREEN_HORIZONTAL_RESOLUTION
            )[0];
        }

        public int screen_vertical_resolution () throws Error {
            return this.get_int (
                DeviceDescriptionIntValue.SCREEN_VERTICAL_RESOLUTION
            )[0];
        }

        public int device_class () throws Error {
            return this.get_int (
                DeviceDescriptionIntValue.DEVICE_CLASS
            )[0];
        }

        public int device_flags () throws Error {
            return this.get_int (
                DeviceDescriptionIntValue.DEVICE_FLAGS
            )[0];
        }

        public int control_count () throws Error {
            return this.get_int (
                DeviceDescriptionIntValue.CONTROL_COUNT
            )[0];
        }

        public int[] control_hints () throws Error {
            return this.get_int (
                DeviceDescriptionIntValue.CONTROLS_HINTS
            );
        }

        public int[] control_types () throws Error {
            return this.get_int (
                DeviceDescriptionIntValue.CONTROLS_TYPES
            );
        }

        public Quat rotation_quat () throws Error {
            float[] ret = this.get_float (FloatValue.ROTATION_QUAT, 4);
            var quat = Quat () {
                x = ret[0],
                y = ret[1],
                z = ret[2],
                w = ret[3]
            };
            return quat;
        }

        public float[] left_eye_gl_modelview_matrix () throws Error {
            return this.get_float (FloatValue.LEFT_EYE_GL_MODELVIEW_MATRIX, 16);
        }

        public float[] right_eye_gl_modelview_matrix () throws Error {
            return this.get_float (FloatValue.RIGHT_EYE_GL_MODELVIEW_MATRIX, 16);
        }

        public float[] left_eye_gl_projection_matrix () throws Error {
            return this.get_float (FloatValue.LEFT_EYE_GL_PROJECTION_MATRIX, 16);
        }

        public float[] right_eye_gl_projection_matrix () throws Error {
            return this.get_float (FloatValue.RIGHT_EYE_GL_PROJECTION_MATRIX, 16);
        }

        public Position position_vector () throws Error {
            var ret = this.get_float (FloatValue.POSITION_VECTOR, 3);
            var pos = Position () {
                x = ret[0],
                y = ret[1],
                z = ret[2]
            };
            return pos;
        }

        public float screen_horizontal_size () throws Error {
            return this.get_float (FloatValue.SCREEN_HORIZONTAL_SIZE)[0];
        }

        public float screen_vertical_size () throws Error {
            return this.get_float (FloatValue.SCREEN_VERTICAL_SIZE)[0];
        }

        public float lens_horizontal_separation () throws Error {
            return this.get_float (FloatValue.LENS_HORIZONTAL_SEPARATION)[0];
        }

        public float lens_vertical_position () throws Error {
            return this.get_float (FloatValue.LENS_VERTICAL_POSITION)[0];
        }

        public float left_eye_fov () throws Error {
            return this.get_float (FloatValue.LEFT_EYE_FOV)[0];
        }

        public float left_eye_aspect_ratio () throws Error {
            return this.get_float (FloatValue.LEFT_EYE_ASPECT_RATIO)[0];
        }

        public float right_eye_fov () throws Error {
            return this.get_float (FloatValue.RIGHT_EYE_FOV)[0];
        }

        public float right_eye_aspect_ratio () throws Error {
            return this.get_float (FloatValue.RIGHT_EYE_ASPECT_RATIO)[0];
        }

        public float eye_ipd () throws Error {
            return this.get_float (FloatValue.EYE_IPD)[0];
        }

        public float projection_zfar () throws Error {
            return this.get_float (FloatValue.PROJECTION_ZFAR)[0];
        }

        public float projection_znear () throws Error {
            return this.get_float (FloatValue.PROJECTION_ZNEAR)[0];
        }

        public float[] distortion_k () throws Error {
            return this.get_float (FloatValue.DISTORTION_K, 6);
        }

        public float[] external_sensor_fusion () throws Error {
            return this.get_float (FloatValue.EXTERNAL_SENSOR_FUSION, 10);
        }

        public float[] universal_distortion_k () throws Error {
            return this.get_float (FloatValue.UNIVERSAL_DISTORTION_K, 4);
        }

        public float[] universal_abberation_k () throws Error {
            return this.get_float (FloatValue.UNIVERSAL_ABERRATION_K, 3);
        }

        public float[] controls_state () throws Error {
            int size = control_count ();
            return this.get_float (FloatValue.CONTROLS_STATE, size);
        }

        public Device (
            Context context,
            int index,
            DeviceSettings? settings
        ) throws Error {
            Object (
                context: context,
                index: index,
                settings: settings
            );

            if (this.dev == null) {
                throw new Error.DEVICE_OPEN_FAIL (
                    @"Failed to open device with index='$(this.index)'"
                );
            };
        }

        construct {
            this.dev = ohmd.list_open_device (
                (ohmd._context)this.context.handle.ptr,
                this.index
            );
            debug (@"Device was opened: '$((uint)this.dev)'");
        }

        ~Device () {
            if (this.dev != null) {
                debug (@"Close device: '$((uint)this.dev)'");
                ohmd.close_device (this.dev);
                debug ("Device is closed");
            }
        }

        private float[] get_float (GOpenHMD.FloatValue type, int size = 1) throws Error {
            var t = (ohmd._float_value)type;
            float[] val = new float[size];
            var ret = ohmd.device_getf (this.dev, t, val);

            if (ret < 0) {
                throw new Error.FLOAT_VALUE_GET_FAIL (
                    @"Error retrieving float value: ret = '$(ret)'"
                );
            }

            return val;
        }

        private void set_float (GOpenHMD.FloatValue type, float value) throws Error {
            var t = (ohmd._float_value)type;
            var ret = ohmd.device_setf (this.dev, t, ref value);

            if (ret < 0) {
                throw new Error.FLOAT_VALUE_SET_FAIL (
                    @"Error setting integer value: ret = '$(ret)'"
                );
            }
        }

        private void set_dat (GOpenHMD.DataValue type, void* val) throws Error {
            var t = (ohmd._data_value)type;
            var ret = ohmd.device_set_data (this.dev, t, val);

            if (ret < 0) {
                throw new Error.DATA_VALUE_SET_FAIL (
                    @"Error setting integer value: ret = '$(ret)'"
                );
            }
        }

        private void set_int (GOpenHMD.DeviceDescriptionIntValue type, int value) throws Error {
            var t = (ohmd._int_value)type;
            var ret = ohmd.device_seti (this.dev, t, value);

            if (ret < 0) {
                throw new Error.INT_VALUE_SET_FAIL (
                    @"Error setting integer value: ret = '$(ret)'"
                );
            }
        }

        private int[] get_int (GOpenHMD.DeviceDescriptionIntValue type, int size = 1) throws Error {
            var t = (ohmd._int_value)type;
            int[] val = new int[size];
            var ret = ohmd.device_geti (this.dev, t, val);

            if (ret < 0) {
                throw new Error.INT_VALUE_GET_FAIL (
                    @"Error getting integer value: ret = '$(ret)'"
                );
            }

            return val;
        }

        public DeviceSettings? settings { get; construct; }
        public Context context { get; construct; }
        public int index { get; construct; }
        private unowned ohmd._device dev;
    }
}
