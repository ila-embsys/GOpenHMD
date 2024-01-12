namespace GOpenHMD {

    public errordomain Error {
        CONTEXT_CREATE_FAIL,
        DEVICE_OPEN_FAIL,
        STRING_DESCRIPTION_GET_FAIL,
        INT_VALUE_GET_FAIL,
        INT_VALUE_SET_FAIL,
        FLOAT_VALUE_GET_FAIL,
        FLOAT_VALUE_SET_FAIL,
        DATA_VALUE_SET_FAIL,
    }

    public struct Version {
        int major;
        int minor;
        int patch;

        public Version () {
            ohmd.get_version (out this.major, out this.minor, out this.patch);
        }

        public string to_string () {
            return @"$major.$minor.$patch";
        }
    }

    public Version version () {
        var v = Version ();
        return v;
    }

    public void sleep (double time) {
        ohmd.sleep (time);
    }

    public string gets (StringDescription description) throws Error {
        var type = (ohmd._string_description) description;
        string* o;
        ohmd.gets (type, out o);
        if (o == null) {
            throw new Error.STRING_DESCRIPTION_GET_FAIL (
                "Can not get setring description, a pointer is zero"
            );
        }
        return o;
    }

}
