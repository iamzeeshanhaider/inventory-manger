class Notification {
    success(message = "Successfully Done !") {
        new Noty({
            type: "success",
            layout: "topRight",
            text: message,
            timeout: 1000,
        }).show();
    }

    alert() {
        new Noty({
            type: "alert",
            layout: "topRight",
            text: "Are you Sure !",
            timeout: 2000,
        }).show();
    }
    error(error_message = "Something Went Wrong !") {
        new Noty({
            type: "error",
            layout: "topRight",
            text: error_message,
            timeout: 2000,
        }).show();
    }
    warning() {
        new Noty({
            type: "warning",
            layout: "topRight",
            text: "Ops Worng !",
            timeout: 2000,
        }).show();
    }
    img_validation() {
        new Noty({
            type: "error",
            layout: "topRight",
            text: "Upload Image less then 1MB !",
            timeout: 2000,
        }).show();
    }
}
export default Notification = new Notification();
