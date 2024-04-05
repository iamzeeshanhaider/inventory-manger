let login = require("./components/auth/Login.vue").default;
let register = require("./components/auth/Register.vue").default;
let forget = require("./components/auth/Forget.vue").default;
let logout = require("./components/auth/Logout.vue").default;
//End Authentication
let home = require("./components/home.vue").default;

let inventory = require("./components/inventory/index.vue").default;
let storeInventory = require("./components/inventory/create.vue").default;
let editInventory = require("./components/inventory/edit.vue").default;
let item = require("./components/inventory/items.vue").default;

let storeItem = require("./components/item/create.vue").default;
let editItem = require("./components/item/edit.vue").default;

export const routes = [
    { path: "/", component: login, name: "/" },
    { path: "/register", component: register, name: "register" },
    { path: "/forget", component: forget, name: "forget" },
    { path: "/logout", component: logout, name: "logout" },
    { path: "/home", component: home, name: "home" },

    {
        path: "/inventory",
        component: inventory,
        name: "inventory",
    },
    {
        path: "/store-inventory",
        component: storeInventory,
        name: "store-inventory",
    },
    {
        path: "/edit-inventory",
        component: editInventory,
        name: "edit-inventory",
    },
    {
        path: "/item/:inventory_id",
        component: item,
        name: "item",
    },
    {
        path: "/store-item/:inventory_id",
        component: storeItem,
        name: "store-item",
    },
    {
        path: "/edit-item/:item_id",
        component: editItem,
        name: "edit-item",
    },
];
