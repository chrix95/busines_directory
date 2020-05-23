<template>
    <div>
        <div class="container content">
            <div class="title m-b-md">
                Business Directory
            </div>
            <div class="form-group">
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text">Search</div>
                    </div>
                    <input type="text" class="form-control form-control-lg" id="inlineFormInputGroup" placeholder="Search Listing..." v-model="searchparam" @keyup="search(searchparam)">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-3" v-for="(item, index) in listings" :key="index" style="margin: 15px 0px">
                    <div class="card-group">
                        <listing-component :business="item"></listing-component>
                    </div>
                </div>
            </div>
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
            }
        },
        data() {
            return {
                listings: [],
                searchparam: ''
            }
        },
        mounted() {
            this.listings = this.business
        },
        methods: {
            search () {
                if (this.searchparam == "") {
                    this.listings = this.business
                } else {
                    var that = this
                    BusinessService.search(this.searchparam)
                        .then((result) => {
                            that.listings = []
                            that.listings = result.data.data
                        }).catch((err) => {
                            that.listings = that.business
                            alert('Search went wrong...')
                        })
                }
            },
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
</style>
