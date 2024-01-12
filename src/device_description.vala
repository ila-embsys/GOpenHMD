namespace GOpenHMD {

// Enumerated device
public class DeviceDescription : Object {

    public string vendor {
        get {
            return this.ctx.list_gets (
                this.index, DeviceDescriptionStringValue.VENDOR
            );
        }
    }

    public string product {
        get {
            return this.ctx.list_gets (
                this.index, DeviceDescriptionStringValue.PRODUCT
            );
        }
    }

    public string path {
        get {
            return this.ctx.list_gets (
                this.index, DeviceDescriptionStringValue.PATH
            );
        }
    }

    public int? screen_horizontal_resolution {
        get {
            try {
                int hres = this.ctx.list_geti (
                    this.index,
                    DeviceDescriptionIntValue.SCREEN_HORIZONTAL_RESOLUTION
                );
                return hres;
            } catch (Error ex) { return null; }
        }
    }

    public int? screen_vertical_resolution {
        get {
            try {
                int hres = this.ctx.list_geti (
                    this.index,
                    DeviceDescriptionIntValue.SCREEN_VERTICAL_RESOLUTION
                );
                return hres;
            } catch (Error ex) { return null; }
        }
    }

    public int? device_class {
        get {
            try {
                int hres = this.ctx.list_geti (
                    this.index,
                    DeviceDescriptionIntValue.DEVICE_CLASS
                );
                return hres;
            } catch (Error ex) { return null; }
        }
    }

    public int? device_flags {
        get {
            try {
                int hres = this.ctx.list_geti (
                    this.index,
                    DeviceDescriptionIntValue.DEVICE_FLAGS
                );
                return hres;
            } catch (Error ex) { return null; }
        }
    }

    public int? control_count {
        get {
            try {
                int hres = this.ctx.list_geti (
                    this.index,
                    DeviceDescriptionIntValue.CONTROL_COUNT
                );
                return hres;
            } catch (Error ex) { return null; }
        }
    }

    public int? control_hints {
        get {
            try {
                int hres = this.ctx.list_geti (
                    this.index,
                    DeviceDescriptionIntValue.CONTROLS_HINTS
                );
                return hres;
            } catch (Error ex) { return null; }
        }
    }

    public int? control_types {
        get {
            try {
                int hres = this.ctx.list_geti (
                    this.index,
                    DeviceDescriptionIntValue.CONTROLS_TYPES
                );
                return hres;
            } catch (Error ex) { return null; }
        }
    }

    public DeviceDescription (GOpenHMD.Context ctx, int index) {
        Object (
            ctx: ctx,
            index: index
        );
    }

    construct {}

    public int index { get; construct; }
    public GOpenHMD.Context ctx { get; construct; }
}
}