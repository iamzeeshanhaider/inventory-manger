require("./bootstrap");
window.baseurl = "http://localhost:8000/";
window.imageBaseurl = "http://localhost/inventory/";

import Vue from "vue";
import VueRouter from "vue-router";
const axios = require("axios").default;
Vue.use(VueRouter);
//pagination
// Vue.component("pagination", require("laravel-vue-pagination"));
//Routes Import

import { routes } from "./routes";
//Import User Class
import User from "./Helpers/User";
window.User = User;

//Notification
import Notification from "./Helpers/Notification";

window.Notification = Notification;

//Swwtalart 2 start
import Swal from "sweetalert2";
window.Swal = Swal;

const Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener("mouseenter", Swal.stopTimer);
        toast.addEventListener("mouseleave", Swal.resumeTimer);
    },
});
window.Toast = Toast;
//Swwtalart 2 End

axios.interceptors.response.use(
    function (response) {
        return response;
    },
    function (error) {
        if (error.response.status === 401) {
            if (router.currentRoute.name !== "/") {
                Swal.fire({
                    title: "Unauthorized!",
                    text: "Unauthorized. Please log in again.",
                    icon: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: "Ok",
                }).then(() => {
                    router.push({ name: "/" });
                });
            } else {
                Toast.fire({
                    icon: "warning",
                    title: "Invalid Email or Password!",
                });
            }
        }
        return Promise.reject(error);
    }
);

window.Reload = new Vue();

const router = new VueRouter({
    routes,
    mode: "history",
});

const app = new Vue({
    el: "#app",
    router,
});
