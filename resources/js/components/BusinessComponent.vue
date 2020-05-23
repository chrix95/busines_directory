<template>
    <div>
        <div class="form-group" v-if="error">
            <div class="col">
                <div class="alert alert-warning" role="alert">
                    {{ message }}
                </div>
            </div>
        </div>
        <form @submit.prevent="updateBusiness()" style="margin: 15px 0px;" v-if="showEdit">
            <div class="col">
                <div class="form-group">
                    <h5>Edit Business <span class="pull-right" @click="showEdit = false">x</span></h5>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" placeholder="Business name" v-model="fields.name">
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Business Email" v-model="fields.email">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" placeholder="Business phone" v-model="fields.phone">
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="website">Website</label>
                        <input type="url" class="form-control" id="website" placeholder="Business website" v-model="fields.website">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="exampleFormControlSelect2">Select Category</label>
                        <select multiple class="form-control" id="exampleFormControlSelect2" v-model="fields.category">
                            <option v-for="(cat, index) in category" :key="index" :value="cat.id">
                                {{ cat.name }}
                            </option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="customFile">Choose file</label>
                        <input type="file" class="form-control" id="customFile" @change="onFileChange">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea id="address" cols="30" rows="5" placeholder="Address" class="form-control" v-model="fields.address"></textarea>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" cols="30" rows="5" placeholder="Description" class="form-control" v-model="fields.description"></textarea>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" v-if="!loading">Update</button>
                        <button type="button" class="btn btn-primary" disabled v-else>Loading...</button>
                    </div>
                </div>
            </div>
        </form>
        <form @submit.prevent="createBusiness()" style="margin: 15px 0px;" v-if="showCreate">
            <div class="col">
                <div class="form-group">
                    <h5>Create Business <span class="pull-right" @click="showCreate = false">x</span></h5>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" placeholder="Business name" v-model="payload.name">
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Business Email" v-model="payload.email">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" placeholder="Business phone" v-model="payload.phone">
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="website">Website</label>
                        <input type="url" class="form-control" id="website" placeholder="Business website" v-model="payload.website">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="exampleFormControlSelect2">Select Category</label>
                        <select multiple class="form-control" id="exampleFormControlSelect2" v-model="payload.category">
                            <option v-for="(cat, index) in category" :key="index" :value="cat.id">
                                {{ cat.name }}
                            </option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="customFile">Choose file</label>
                        <input type="file" class="form-control" id="customFile" @change="onFileChange">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea id="address" cols="30" rows="5" placeholder="Address" class="form-control" v-model="payload.address"></textarea>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" cols="30" rows="5" placeholder="Description" class="form-control" v-model="payload.description"></textarea>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" v-if="!loading">Create</button>
                        <button type="button" class="btn btn-primary" disabled v-else>Loading...</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="table-responsive">
            <form class="form-inline">
                <div class="form-group">
                    <label for="search"><strong>Search</strong></label>
                    <input type="text" id="search" class="form-control mx-sm-3" aria-describedby="searchoption" v-model="searchparam" @keyup="search(searchparam)">
                </div>
            </form>
            <button type="button" class="btn btn-outline-info btn-sm pull-right" style="margin-bottom: 15px" @click="showCreate=true;showEdit=false" v-show="!showCreate">Create</button>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Email</th>
                        <th scope="col">Views</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(cat, index) in listings" :key="index">
                        <th scope="row">{{ index + 1 }}</th>
                        <td>{{ cat.name }}</td>
                        <td>{{ cat.phone }}</td>
                        <td>{{ cat.email }}</td>
                        <td>{{ cat.views }}</td>
                        <td>{{ cat.status[0].toUpperCase() + cat.status.slice(1) }}</td>
                        <td class="row justify-content-center">
                            <button type="button" class="btn btn-outline-info btn-sm" @click="view(cat.id)">
                                <span class="ti-eye"></span>
                            </button>
                            <button type="button" class="btn btn-outline-info btn-sm" @click="edit(cat.id)">
                                <span class="ti-pencil-alt"></span>
                            </button>
                            <button type="button" class="btn btn-outline-danger btn-sm" @click="destroy(cat.id)">
                                <span class="ti-trash"></span>
                            </button>
                            <button type="button" class="btn btn-outline-success btn-sm btn-block" @click="updateStatus(cat.id, 'active')" v-if="cat.status == 'inactive'">
                                <span class="ti-thumb-up"></span>
                                Activate
                            </button>
                            <button type="button" class="btn btn-outline-warning btn-sm btn-block" @click="updateStatus(cat.id, 'inactive')" v-else>
                                <span class="ti-thumb-down"></span>
                                Deactivate
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
    import BusinessService from "../services/BusinessService";
    export default {
        props: {
            business: {
                type: [Array],
                required: true
            },
            category: {
                type: [Array],
                required: true
            }
        },
        data() {
            return {
                payload: {
                    category: []
                },
                fields: {
                    category: []
                },
                message: '',
                showEdit: false,
                showCreate: false,
                error: false,
                editId: null,
                loading: false,
                searchparam: '',
                listings: []
            }
        },
        mounted() {
            this.listings = this.business
        },
        methods: {
            search () {
                if (this.searchparam == '') {
                    this.listings = this.business
                } else {
                    BusinessService.search(this.searchparam)
                        .then((result) => {
                            this.listings = result.data.data
                        }).catch((err) => {
                            alert('Search went wrong...')
                            this.listings = this.business
                        })
                }
            },
            onFileChange(e) {
                this.payload.image = e.target.files[0];
                this.fields.image = e.target.files[0];
            },
            view (id) {
                window.location.href = `/business/view/${id}`
            },
            edit (id) {
                var that = this
                this.showCreate = false
                BusinessService.get_one_business(id)
                    .then((result) => {
                        this.fields.name = result.data.data.name
                        this.fields.email = result.data.data.email
                        this.fields.phone = result.data.data.phone
                        this.fields.website = result.data.data.website
                        this.fields.address = result.data.data.address
                        this.fields.description = result.data.data.description
                        this.editId = result.data.data.id
                        result.data.data.businesscategory.forEach(element => {
                            this.fields.category.push(element.category_id)
                        });
                        that.showEdit = true
                    }).catch((err) => {
                        that.showEdit = false
                        alert('Error fetching business')
                    })
            },
            updateStatus (id, status) {
                BusinessService.update_status(id, status)
                    .then((result) => {
                        window.location.reload()
                    }).catch((err) => {
                        this.message = err.response.data.message ? err.response.data.message : err.response.data.error
                        this.error = true
                    })
            },
            updateBusiness () {
                if(this.validateFields()) {
                    this.loading = true
                    let formData = new FormData();
                    formData.append('name', this.fields.name)
                    formData.append('phone', this.fields.phone)
                    formData.append('email', this.fields.email)
                    formData.append('website', this.fields.website)
                    formData.append('image', this.fields.image)
                    formData.append('address', this.fields.address)
                    formData.append('description', this.fields.description)
                    formData.append('category', this.fields.category)
                    BusinessService.update_business(this.editId, formData)
                        .then((result) => {
                            window.location.reload()
                        }).catch((err) => {
                            this.loading = false
                            this.message = err.response.data.data['image'][0]
                            this.error = true
                        })
                }
            },
            createBusiness () {
                if(this.validatePayload()) {
                    this.loading = true
                    let formData = new FormData();
                    formData.append('name', this.payload.name)
                    formData.append('phone', this.payload.phone)
                    formData.append('email', this.payload.email)
                    formData.append('website', this.payload.website)
                    formData.append('image', this.payload.image)
                    formData.append('address', this.payload.address)
                    formData.append('category', this.payload.category)
                    formData.append('description', this.payload.description)
                    BusinessService.create_business(formData)
                        .then((result) => {
                            window.location.reload()
                        }).catch((err) => {
                            this.loading = false
                            this.message = err.response.data.data['image']
                            this.message = err.response.data.data['message']
                            this.error = true
                        })
                }
            },
            destroy (id) {
                if (confirm("Do you want to delete?") == true) {
                    BusinessService.delete_business(id)
                        .then((result) => {
                            window.location.reload()
                        }).catch((err) => {
                            alert('Error deleting')
                        })
                }
            },
            validateFields() {
                if(this.fields.name) {
                    if(this.fields.email) {
                        if(this.fields.phone) {
                            if(this.fields.website) {
                                if(this.fields.address) {
                                    if(this.fields.description) {
                                        if(this.fields.category.length > 0) {
                                            return true
                                        } else {
                                            this.message = 'Select at least one category'
                                            this.error = true
                                            setTimeout(() => {
                                                this.error = false
                                            }, 2500);
                                        }
                                    } else {
                                        this.message = 'Enter company description'
                                        this.error = true
                                        setTimeout(() => {
                                            this.error = false
                                        }, 2500);
                                    }
                                } else {
                                    this.message = 'Enter company address'
                                    this.error = true
                                    setTimeout(() => {
                                        this.error = false
                                    }, 2500);
                                }
                            }   else {
                                this.message = 'Enter company website'
                                this.error = true
                                setTimeout(() => {
                                    this.error = false
                                }, 2500);
                            }
                        } else {
                            this.message = 'Enter company phone'
                            this.error = true
                            setTimeout(() => {
                                this.error = false
                            }, 2500);
                        }
                    } else {
                        this.message = 'Enter company email'
                        this.error = true
                        setTimeout(() => {
                            this.error = false
                        }, 2500);
                    }
                } else {
                    this.message = 'Enter a company name'
                    this.error = true
                    setTimeout(() => {
                        this.error = false
                    }, 2500);
                }
            },
            validatePayload() {
                if(this.payload.name) {
                    if(this.payload.email) {
                        if(this.payload.phone) {
                            if(this.payload.website) {
                                if(this.payload.image) {
                                    if(this.payload.address) {
                                        if(this.payload.description) {
                                            if(this.payload.category.length > 0) {
                                                return true
                                            } else {
                                                this.message = 'Select at least one category'
                                                this.error = true
                                                setTimeout(() => {
                                                    this.error = false
                                                }, 2500);
                                            }
                                        } else {
                                            this.message = 'Enter company description'
                                            this.error = true
                                            setTimeout(() => {
                                                this.error = false
                                            }, 2500);
                                        }
                                    } else {
                                        this.message = 'Enter company address'
                                        this.error = true
                                        setTimeout(() => {
                                            this.error = false
                                        }, 2500);
                                    }
                                } else {
                                    this.message = 'Select a valid image'
                                    this.error = true
                                    setTimeout(() => {
                                        this.error = false
                                    }, 2500);
                                }
                            }   else {
                                this.message = 'Enter company website'
                                this.error = true
                                setTimeout(() => {
                                    this.error = false
                                }, 2500);
                            }
                        } else {
                            this.message = 'Enter company phone'
                            this.error = true
                            setTimeout(() => {
                                this.error = false
                            }, 2500);
                        }
                    } else {
                        this.message = 'Enter company email'
                        this.error = true
                        setTimeout(() => {
                            this.error = false
                        }, 2500);
                    }
                } else {
                    this.message = 'Enter a company name'
                    this.error = true
                    setTimeout(() => {
                        this.error = false
                    }, 2500);
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
button {
    margin: 3px;
}
</style>
