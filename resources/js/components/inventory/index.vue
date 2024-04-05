<template>
    <div>
        <div class="row">
            <div class="col-md-3">
                <router-link to="/store-inventory" class="btn btn-primary"
                    >Add Inventory</router-link
                >
            </div>
        </div>
        <br />
        <input
            type="text"
            class="form-control"
            style="width: 300px"
            v-model="searchTerm"
            placeholder="Search here by Name"
        />
        <div class="row my-3">
            <div class="col-lg-12 mb-4">
                <!-- Simple Tables -->
                <div class="card">
                    <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                    >
                        <h6 class="m-0 font-weight-bold text-primary">
                            Inventory List
                        </h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th>SL</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(inventory, index) in filtersearch"
                                    :key="inventory.id"
                                >
                                    <td>{{ index + 1 }}</td>
                                    <td>{{ inventory.name }}</td>
                                    <td>
                                        <router-link
                                            :to="{
                                                name: 'edit-inventory',
                                                params: { id: inventory.id },
                                            }"
                                            class="btn btn-sm btn-primary"
                                            >Edit</router-link
                                        >
                                        <router-link
                                            :to="{
                                                name: 'item',
                                                params: { inventory_id: inventory.id },
                                            }"
                                            class="btn btn-sm btn-primary"
                                            >View Items</router-link
                                        >
                                        <a
                                            @click="deleteInventory(inventory.id)"
                                            class="btn btn-sm btn-danger"
                                            >Delete</a
                                        >
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer"></div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    created() {
        console.log("Inventory Component");
        this.allInventory();
    },
    data() {
        return {
            inventories: [],
            searchTerm: "",
        };
    },
    computed: {
        filtersearch() {
            return this.inventories.filter((inventory) => {
                return inventory.name.match(this.searchTerm);
            });
        },
    },
    methods: {
        allInventory() {
            axios
                .get("/api/inventory/",{
                    headers: {
                        Authorization: `Bearer ${localStorage.getItem("token")}`,
                    },
                })
                .then(({ data }) => (this.inventories = data))
                .catch();
        },
        deleteInventory(id) {
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!",
            }).then((result) => {
                if (result.value) {
                    axios
                        .delete("/api/inventory/" + id,{
                            headers: {
                                Authorization: `Bearer ${localStorage.getItem("token")}`,
                            },
                        
                        })
                        .then((resp) => {
                            this.inventories = this.inventories.filter(
                                (inventory) => {
                                    return inventory.id != id;
                                }
                            );

                            Swal.fire(
                        "Deleted!",
                        resp.data.message,
                        "success"
                    );

                        })
                        .catch(() => {
                            this.$router.push({ name: "inventory" });
                        });
                    
                }
            });
        },
    },
};
</script>
<style>
#em_img {
    height: 40px;
    width: 40px;
}
.btn-danger {
    color: #ffff !important;
}
</style>
