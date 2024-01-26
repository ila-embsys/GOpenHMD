namespace GOpenHMD {

// Enumerated device
public class DeviceDescription : Object, IDeviceDescription {

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

    public int screen_horizontal_resolution () throws Error {
        int[] ret = this.ctx.list_geti (
            this.index,
            DeviceDescriptionIntValue.SCREEN_HORIZONTAL_RESOLUTION
        );
        return ret[0];
    }

    public int screen_vertical_resolution () throws Error {
        int[] ret = this.ctx.list_geti (
            this.index,
            DeviceDescriptionIntValue.SCREEN_VERTICAL_RESOLUTION
        );
        return ret[0];
    }

    public int device_class () throws Error {
        int[] ret = this.ctx.list_geti (
            this.index,
            DeviceDescriptionIntValue.DEVICE_CLASS
        );
        return ret[0];
    }

    public int device_flags () throws Error {
        int[] ret = this.ctx.list_geti (
            this.index,
            DeviceDescriptionIntValue.DEVICE_FLAGS,
            4
        );
        return ret[0];
    }

    public int control_count () throws Error {
        int[] ret = this.ctx.list_geti (
            this.index,
            DeviceDescriptionIntValue.CONTROL_COUNT
        );
        return ret[0];
    }

    public int[] control_hints () throws Error {
        var size = this.ctx.list_geti (this.index, DeviceDescriptionIntValue.CONTROL_COUNT)[0];
        int[] ret = this.ctx.list_geti (
            this.index,
            DeviceDescriptionIntValue.CONTROLS_HINTS,
            size
        );
        return ret;
    }

    public int[] control_types () throws Error {
        var size = this.ctx.list_geti (this.index, DeviceDescriptionIntValue.CONTROL_COUNT)[0];
        int[] ret = this.ctx.list_geti (
            this.index,
            DeviceDescriptionIntValue.CONTROLS_TYPES,
            size
        );
        return ret;
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