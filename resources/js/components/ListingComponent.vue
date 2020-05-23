<template>
    <div class="card">
        <img class="card-img-top" :src="business.image" alt="Card image cap" width="50%">
        <div class="card-body">
        <h5 class="card-title uppercase">
            <strong>{{ business.name }}</strong>
        </h5>
        <p class="card-text">{{ listing_name }}</p>
        </div>
        <div class="card-footer">
        <small class="text-muted">
            <span class="ti-star"></span> {{ business.rating }}
            <span class="ti-eye"></span> {{ business.views }}
            <button type="button" class="btn btn-outline-info btn-sm pull-right" @click="viewListing(business.id)">
                View
            </button>
        </small>
        </div>
    </div>
</template>

<script>
    import ListingService from "../services/ListingService";
    export default {
        props: {
            business: {
                type: [Object],
                required: true
            }
        },
        data() {
            return {
                listing_name: ''
            }
        },
        mounted() {
            this.listing_name = this.business.description.substring(0, 150) + "..."
        },
        computed: {},
        methods: {
            viewListing (id) {
                ListingService.view_a_listing(id)
                    .then((result) => {
                        window.location.href = `/listing/view/${id}`
                    }).catch((err) => {
                        alert('Error viewing listing')
                    })
            }
        }
    }
</script>
<style scoped>
.pull-right {
    cursor: pointer;
    float: right !important
}
small span {
    padding: 5px 10px;
}
.uppercase {
    text-transform: uppercase;
}
</style>
