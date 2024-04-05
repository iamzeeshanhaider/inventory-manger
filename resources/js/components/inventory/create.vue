<template>
    <div>
        <div class="row">
            <div class="col-md-3">
                <router-link to="/inventory" class="btn btn-primary"
                    >All Inventory</router-link
                >
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-3">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">
                                            Add Inventory
                                        </h1>
                                    </div>
                                    <form
                                        class="user"
                                        @submit.prevent="inventoryInsert"
                                    >
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6 col-sm-9">
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="exampleInputInventoryName"
                                                        placeholder="Enter Name"
                                                        v-model="
                                                            form.name
                                                        "
                                                    />
                                                    <small
                                                        class="text-danger"
                                                        v-if="
                                                            errors.name
                                                        "
                                                    >
                                                        {{
                                                            errors
                                                                .name[0]
                                                        }}
                                                    </small>
                                                </div>
                                                <div class="col-md-6 col-sm-9">
                                                    <textarea
                                                       
                                                        class="form-control"
                                                        id="exampleInputInventoryDescription"
                                                        placeholder="Enter Description"
                                                        v-model="
                                                            form.description
                                                        "
                                                    ></textarea>
                                                    <small
                                                        class="text-danger"
                                                        v-if="
                                                            errors.description
                                                        "
                                                    >
                                                        {{
                                                            errors
                                                                .description[0]
                                                        }}
                                                    </small>
                                                </div>
                                                <div class="col-md-2 col-sm-3">
                                                    <button
                                                        type="submit"
                                                        class="btn btn-primary btn-block"
                                                    >
                                                        Submit
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    created() {
        if (!User.loggedIn()) {
            this.$router.push({ name: "/" });
        }
    },
    data() {
        return {
            form: {
                name: null,
                description: null,
            },
            errors: {},
        };
    },
    methods: {
        inventoryInsert() {
            axios
                .post("/api/inventory", this.form, {
                    headers: {
                        Authorization: `Bearer ${localStorage.getItem("token")}`,
                    },
                })
                .then((resp) => {
                    this.$router.push({ name: "inventory" });
                    resp = resp.data;
                    if(resp.code == 200) {
                        Notification.success(
                            resp.message
                        );
                    }
                })
                .catch((error) => {
                    this.errors = error.response.data.errors
                    let res = error.response.data;
                    Notification.error(
                            res.message
                        );
                });
        },
    },
};
</script>
<style></style>
