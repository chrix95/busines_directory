<template>
    <div>
        <div class="form-group" v-if="error">
            <div class="col">
                <div class="alert alert-warning" role="alert">
                    {{ message }}
                </div>
            </div>
        </div>
        <form @submit.prevent="updateCategory()" style="margin: 15px 0px;" v-if="showEdit">
            <div class="form-group">
                <div class="col">
                    Edit Category <span class="pull-right" @click="showEdit = false">x</span>
                </div>
            </div>
            <div class="form-group">
                <div class="col">
                    <input type="text" class="form-control" placeholder="Category name" v-model="fields.name">
                </div>
                <input type="hidden" class="form-control" placeholder="Category name" v-model="editId">
            </div>
            <div class="form-group">
                <div class="col">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </div>
        </form>
        <form @submit.prevent="createCategory()" style="margin: 15px 0px;" v-if="showCreate">
            <div class="form-group">
                <div class="col">
                    Create Category <span class="pull-right" @click="showCreate = false">x</span>
                </div>
            </div>
            <div class="form-group">
                <div class="col">
                    <input type="text" class="form-control" placeholder="Category name" v-model="payload.name">
                </div>
            </div>
            <div class="form-group">
                <div class="col">
                    <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </div>
        </form>
        <div class="table-responsive">
            <button type="button" class="btn btn-outline-info btn-sm pull-right" style="margin-bottom: 15px" @click="showCreate=true;showEdit=false" v-show="!showCreate">Create</button>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(cat, index) in category" :key="index">
                        <th scope="row">{{ index + 1 }}</th>
                        <td>{{ cat.name }}</td>
                        <td>
                            <button type="button" class="btn btn-outline-info btn-sm" @click="edit(cat.id)">Edit</button>
                            <button type="button" class="btn btn-outline-danger btn-sm" @click="destroy(cat.id)">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
    import CategoryService from "../services/CategoryService";
    export default {
        props: {
            category: {
                type: [Array],
                required: true
            }
        },
        data() {
            return {
                payload: {},
                fields: {},
                message: '',
                showEdit: false,
                showCreate: false,
                error: false,
                editId: null
            }
        },
        mounted() {},
        methods: {
            edit (id) {
                var that = this
                this.showCreate = false
                CategoryService.get_one_category(id)
                    .then((result) => {
                        this.fields.name = result.data.data.name
                        this.editId = result.data.data.id
                        that.showEdit = true
                    }).catch((err) => {
                        that.showEdit = false
                        alert('Error fetching category')
                    })
            },
            updateCategory () {
                CategoryService.update_category(this.editId, this.fields)
                    .then((result) => {
                        window.location.reload()
                    }).catch((err) => {
                        this.message = err.response.data.message ? err.response.data.message : err.response.data.error
                        this.error = true
                        setTimeout(() => {
                            this.error = false
                        }, 1500);
                    })
            },
            createCategory () {
                console.log(this.payload)
                if(this.validatePayload()) {
                    CategoryService.create_category(this.payload)
                        .then((result) => {
                            window.location.reload()
                        }).catch((err) => {
                            this.message = err.response.data.data['name'][0]
                            this.error = true
                            setTimeout(() => {
                                this.error = false
                            }, 2500);
                        })
                }
            },
            destroy (id) {
                if (confirm("Do you want to delete?") == true) {
                    CategoryService.delete_category(id)
                        .then((result) => {
                            window.location.reload()
                        }).catch((err) => {
                            alert('Error deleting')
                        })
                }
            },
            validatePayload() {
                if(this.payload.name) {
                    return true
                } else {
                    alert('Enter a category name')
                }
            }
        }
    }
</script>
<style scoped>
.pull-right {
    cursor: pointer;
    float: right !important
}
</style>
