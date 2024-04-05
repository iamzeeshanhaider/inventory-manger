<template>
    <div>
        <div class="row">
            <div class="col-md-3">
                <router-link to="/inventory" class="btn btn-primary"
                    >Items</router-link
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
                                            Add Item
                                        </h1>
                                    </div>
                                    <form
                                        class="user"
                                        @submit.prevent="itemInsert"
                                        enctype="multipart/form-data"
                                    >
                                    <input type="hidden" name="inventory_id" v-model="form.inventory_id">
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
                                                        type="number"
                                                        class="form-control"
                                                        id="exampleInputItemQuantity"
                                                        placeholder="Quantity"
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
                                                <br>
                                                <div
                                                    class="col-md-2 col-sm-2"
                                                    v-if="form.preview"
                                                >
                                                    <img
                                                        :src="form.preview"
                                                        style="
                                                            height: 40px;
                                                            width: 40px;
                                                        "
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
    created(){
        this.inventory_id = this.$route.params.inventory_id;
    },
    
    data() {
        return {
            form: {
                name: null,
                description: null,
                image: null,
                inventory_id: this.$route.params.inventory_id,
            },
            errors: {},
        };
    },
    methods: {
        onFileSelected(event) {
            let file = event.target.files[0];
            if (file.size > 1048770) {
                Notification.img_validation();
            } else {
                let reader = new FileReader();
                reader.onload = (event) => {
                    this.form.preview = event.target.result;
                    this.form.image = event.target.result;
                };
                reader.readAsDataURL(file);
            }
        },
        itemInsert() {
            axios
                .post("/api/item", this.form,{
                    headers: {
                        Authorization: `Bearer ${localStorage.getItem("token")}`,
                    },
                })
                .then((resp) => {
                    resp = resp.data;
                    if(resp.code == 200) {
                        this.$router.push({ name: "item", params: {inventory_id : this.$route.params.inventory_id} });
                        Notification.success(
                            resp.message
                        );
                    }
                })
                .catch((error) => (this.errors = error.response.data.errors));
        },
    },
};
</script>
<style></style>
