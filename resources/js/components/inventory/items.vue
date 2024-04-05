<template>
    <div>
        <div class="row">
            <div class="col-md-3">
                <router-link :to="'/store-item/' + $route.params.inventory_id" class="btn btn-primary"
                    >Add Item</router-link
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
                            Items List
                        </h6>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th>SL</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(item, index) in filtersearch"
                                    :key="item.id"
                                >
                                    <td>{{ index + 1 }}</td>
                                    <td>{{ item.name }}</td>
                                    <td>{{ item.quantity }}</td>
                                    
                                    <td>
                                        <router-link
                                            :to="{
                                                name: 'edit-item',
                                                params: { item_id: item.id },
                                            }"
                                            class="btn btn-sm btn-primary"
                                            >Edit Item</router-link
                                        >
                                        <a
                                            @click="deleteItem(item.id)"
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
        console.log("Item Component");
        this.allItem();
    },
    data() {
        return {
            items: [],
            searchTerm: "",
        };
    },
    computed: {
        filtersearch() {
            return this.items.filter((item) => {
                return item.name.match(this.searchTerm);
            });
        },
    },
    methods: {
        allItem() {
            let inventory_id = this.$route.params.inventory_id;
            axios
                .get("/api/items/"+inventory_id+"", {
                    headers: {
                        Authorization: `Bearer ${localStorage.getItem("token")}`,

                    },
                })
                .then(({ data }) => (this.items = data))
                .catch();
        },
        deleteItem(id) {
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
                        .delete("/api/item/" + id, {
                            headers: {
                                Authorization: `Bearer ${localStorage.getItem("token")}`,
                            },
                        })
                        .then((resp) => {
                            this.items = this.items.filter(
                                (item) => {
                                    return item.id != id;
                                }
                            );
                            Swal.fire(
                        "Deleted!",
                        resp.data.message,
                        "success"
                    );
                        })
                        .catch(() => {
                            this.$router.push({ name: "item" });
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
