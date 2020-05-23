<template>
    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <img
                        class="card-img-top img-responsive"
                        :src="setImagePath(listing.image)"
                        :alt="listing.name"
                    />
                </div>
                <div
                    class="col-md-4"
                    v-for="(img, index) in listing.images"
                    :key="index"
                >
                    <img
                        class="card-img-top img-responsive"
                        :src="setImagePath(img.image)"
                        :alt="listing.name"
                    />
                </div>
            </div>
            <br />
            <div class="card-title text-center">
                <h3 class="uppercase">
                    <strong>
                        {{ listing.name }}
                    </strong>
                </h3>
                <h5>
                    {{ listing.address }} <br />
                    {{ listing.phone }} || {{ listing.email }}
                </h5>
            </div>
            <h5 class="card-text">
                <strong>Description: </strong> {{ listing.description }}
            </h5>
            <h5><strong>Website: </strong> {{ listing.website }}</h5>
            <h5><strong>Rating: </strong> {{ listing.rating }}</h5>
            <h5><strong>Views: </strong> {{ listing.views }}</h5>
            <h5 class="uppercase">
                <strong>Status: </strong> {{ listing.status }}
            </h5>
            <h5>
                <strong>Category: </strong>
                <ul>
                    <li
                        v-for="(cat, index) in listing.businesscategory"
                        :key="index"
                    >
                        {{ cat.category.name }}
                    </li>
                </ul>
            </h5>
            <h5>
                <button
                    type="button"
                    class="btn btn-outline-success btn-md"
                    @click="showUpload(true)"
                    v-if="!show"
                >
                    Add Image
                </button>
                <div class="form-row" v-if="show">
                    <div class="col">
                        <div class="form-group">
                            <input type="file" class="form-control" id="customFile" @change="onFileChange">
                            <label for="customFile">Dimension (320x320px)</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group" v-if="!loading">
                            <button
                                type="button"
                                class="btn btn-outline-success btn-md"
                                @click="uploadImage()"
                            >
                                Upload
                            </button>
                            <button
                                type="button"
                                class="btn btn-outline-success btn-md"
                                @click="showUpload(false)"
                            >
                                Cancel
                            </button>
                        </div>
                        <div class="form-group" v-else>
                            <button
                                type="button"
                                class="btn btn-outline-success btn-md"
                                disabled
                            >
                               Uploading
                            </button>
                        </div>
                    </div>
                </div>
            </h5>
            <br><br>
            <a href="/business">
                <button
                    type="button"
                    class="btn btn-outline-success btn-sm btn-block"
                >
                    Back to list
                </button>
            </a>
        </div>
    </div>
</template>

<script>
import BusinessService from "../services/BusinessService";
export default {
    props: {
        business: {
            type: [Object],
            required: true
        }
    },
    data() {
        return {
            listing: {},
            loading: false,
            payload: {},
            show: false
        };
    },
    mounted() {
        this.listing = this.business;
    },
    methods: {
        showUpload(value) {
            this.show = value
        },
        setImagePath(image) {
            return "/" + image;
        },
        onFileChange(e) {
            this.payload.image = e.target.files[0];
        },
        uploadImage() {
            if(this.validatePayload()) {
                this.loading = true
                let formData = new FormData();
                formData.append('image', this.payload.image)
                BusinessService.upload_image(this.listing.id, formData)
                    .then((result) => {
                        this.loading = false
                        window.location.reload()
                    }).catch((err) => {
                        this.loading = false
                        alert(err.response.data.data.image ? err.response.data.data.image : err.response.data.message)
                    })
            }
        },
        validatePayload() {
            if (this.payload.image) {
                return true
            } else {
                alert('Select an image')
            }
        }
    }
};
</script>
<style scoped>
.pull-right {
    cursor: pointer;
    float: right !important;
}
small span {
    padding: 5px 10px;
}
.uppercase {
    text-transform: uppercase;
}
</style>
