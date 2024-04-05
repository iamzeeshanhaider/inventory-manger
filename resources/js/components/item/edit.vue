<template>
    <div>
        <div class="row">
            <div class="col-md-3">
              
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-xl-12 col-lg-12 col-md-12">
                <div class="card shadow-sm my-3">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">
                                            Update Item
                                        </h1>
                                    </div>
                                    <form
                                        class="user"
                                        @submit.prevent="updateItem"
                                    >
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-6 col-sm-9">
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="exampleInputItemName"
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
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="exampleInputItemQuantity"
                                                        placeholder="Enter Quantity"
                                                        v-model="
                                                            form.quantity
                                                        "
                                                    />
                                                    <small
                                                        class="text-danger"
                                                        v-if="
                                                            errors.quantity
                                                        "
                                                    >
                                                        {{
                                                            errors
                                                                .quantity[0]
                                                        }}
                                                    </small>
                                                </div>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-12 col-sm-10">
                                                    <input
                                                        type="file"
                                                        class="custom-file-input"
                                                        id="customFile"
                                                        @change="onFileSelected"
                                                    />
                                                    <label
                                                        class="custom-file-label"
                                                        for="customFile"
                                                        >Choose Photo</label
                                                    >
                                                    <small
                                                        class="text-danger"
                                                        v-if="errors.image"
                                                    >
                                                        {{ errors.image[0] }}
                                                    </small>
                                                </div>

                                                <div
                                                    class="col-md-6 col-sm-2"
                                                    v-if="preview"
                                                >
                                                    <img
                                                        :src="preview"
                                                        style="
                                                            height: 40px;
                                                            width: 40px;
                                                        "
                                                    />
                                                </div>
                                                <div class="col-md-6" v-else>
                                                    <img
    :src="getImageUrl(form.image)"
    style="height: 40px; width: 40px;"
/>
                                                </div>
                                                </div>
                                                </div>
                                                <div class="form-group">
                                            <div class="form-row">
                                                <div class="col-md-12 col-sm-9">
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
                                                </div>
                                                </div>
                                                <div class="form-group">
                                            <div class="form-row">
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
                name: "",
                description: "",
                image: "",
                quantity: "",
            },
            errors: {},
        };
    }, 

    created() {
        let id = this.$route.params.item_id;
        axios
            .get("/api/item/" + id, {
                headers: {
                                Authorization: `Bearer ${localStorage.getItem("token")}`,
                            },
            })
            .then(({ data }) => (this.form = data))
            .catch(console.log("error"));
    },
    methods: {
        getImageUrl(imagePath) {
            return window.imageBaseurl + 'storage/app/public/' + imagePath;
        },
        onFileSelected(event) {
            let file = event.target.files[0];
            if (file.size > 1048770) {
                Notification.img_validation();
            } else {
                let reader = new FileReader();
                reader.onload = (event) => {
                    this.preview = event.target.result;
                    this.form.new_image = event.target.result;
                };
                reader.readAsDataURL(file);
            }
        },
        updateItem() {
            let id = this.$route.params.item_id;
            axios
                .patch("/api/item/" + id, this.form ,{
                    headers: {
                                Authorization: `Bearer ${localStorage.getItem("token")}`,
                            },
                })
                .then((resp) => {
                    resp = resp.data;
                    console.log(resp);
                    if(resp.code == 200){
                        // console.log("inventory_id", resp.inventory_id);
                        this.$router.push({ name: "item", params : {inventory_id : resp.data.inventory_id} });
                        Notification.success(resp.message);
                    }

                })
                .catch((error) => (this.errors = error.response.data.errors));
        },
    },
};
</script>
<style></style>
