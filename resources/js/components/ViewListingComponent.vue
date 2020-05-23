<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-md-4">
                                <img class="card-img-top img-responsive" :src="setImagePath(listing.image)" :alt="listing.name">
                            </div>
                            <div class="col-md-4" v-for="(img, index) in listing.images" :key="index">
                                <img class="card-img-top img-responsive" :src="setImagePath(img.image)" :alt="listing.name">
                            </div>
                        </div>
                        <br>
                        <div class="card-title text-center">
                            <h3 class="uppercase">
                                <strong>
                                    {{ listing.name }}
                                </strong>
                            </h3>
                            <h5>
                                {{ listing.address }} <br>
                                {{ listing.phone }} || {{ listing.email}}
                            </h5>
                        </div>
                        <h5 class="card-text">
                            <strong>Description: </strong> {{ listing.description }}
                        </h5>
                        <h5>
                            <strong>Website: </strong> {{ listing.website }}
                        </h5>
                        <h5>
                            <strong>Rating: </strong> {{ listing.rating }}
                        </h5>
                        <h5>
                            <strong>Views: </strong> {{ listing.views }}
                        </h5>
                        <h5 class="uppercase">
                            <strong>Status: </strong> {{ listing.status }}
                        </h5>
                        <h5>
                            <strong>Category: </strong>
                            <ul>
                                <li v-for="(cat, index) in listing.businesscategory" :key="index">
                                    {{ cat.category.name }}
                                </li>
                            </ul>
                        </h5>
                        <div class="demo">
                            <div class="ratingControl">
                                <input v-model="rate" type="radio" id="rating-5" name="rating" value="5">
                                <label class="ratingControl-stars ratingControl-stars--5" for="rating-5">5</label>
                                <input v-model="rate" type="radio" id="rating-45" name="rating" value="4.5">
                                <label class="ratingControl-stars ratingControl-stars--45 ratingControl-stars--half" for="rating-45">45</label>
                                <input v-model="rate" type="radio" id="rating-4" name="rating" value="4">
                                <label class="ratingControl-stars ratingControl-stars--4" for="rating-4">4</label>
                                <input v-model="rate" type="radio" id="rating-35" name="rating" value="3.5">
                                <label class="ratingControl-stars ratingControl-stars--35 ratingControl-stars--half" for="rating-35">35</label>
                                <input v-model="rate" type="radio" id="rating-3" name="rating" value="3">
                                <label class="ratingControl-stars ratingControl-stars--3" for="rating-3">3</label>
                                <input v-model="rate" type="radio" id="rating-25" name="rating" value="2.5">
                                <label class="ratingControl-stars ratingControl-stars--25 ratingControl-stars--half" for="rating-25">25</label>
                                <input v-model="rate" type="radio" id="rating-2" name="rating" value="2">
                                <label class="ratingControl-stars ratingControl-stars--2" for="rating-2">2</label>
                                <input v-model="rate" type="radio" id="rating-15" name="rating" value="1.5">
                                <label class="ratingControl-stars ratingControl-stars--15 ratingControl-stars--half" for="rating-15">15</label>
                                <input v-model="rate" type="radio" id="rating-1" name="rating" value="1">
                                <label class="ratingControl-stars ratingControl-stars--1" for="rating-1">1</label>
                                <input v-model="rate" type="radio" id="rating-05" name="rating" value="0.5">
                                <label class="ratingControl-stars ratingControl-stars--05 ratingControl-stars--half" for="rating-05">05</label>
                                <button type="button" class="btn btn-outline-success btn-md rateBtn" @click="updateRating()" v-if="!loading">
                                    Rate
                                </button>
                                <button type="button" class="btn btn-primary" disabled v-else>Rating...</button>
                            </div>
                        </div>
                        <br><br>
                        <a href="/">
                            <button type="button" class="btn btn-outline-success btn-sm btn-block">
                                Back to list
                            </button>
                        </a>
                    </div>
                </div>
                <br><br>
            </div>
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
                listing: {},
                rate: null,
                rateBtn: true,
                loading: false
            }
        },
        mounted() {
            this.listing = this.business
        },
        methods: {
            setImagePath (image) {
                return '/' + image
            },
            updateRating () {
                this.loading = true
                ListingService.update_rating(this.listing.id, this.rate)
                    .then((result) => {
                        this.listing.rating = result.data.data.rating
                        this.rateBtn = false
                    }).catch((err) => {
                        this.loading = false
                        alert('Error updating rating')
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
.rateBtn {
    position: absolute;
    top: 90px;
    width: auto;
    height: auto;
    z-index: 99999;
}

@import url(https://fonts.googleapis.com/css?family=Francois+One);
 @import url(https://fonts.googleapis.com/css?family=PT+Sans);
 .ratingControl {
	 position: relative;
	 width: 375px;
	 height: 65px;
	 user-select: none;
	 margin: 0 auto;
}
 .ratingControl input {
	 visibility: hidden;
}
 .ratingControl-stars {
	 position: absolute;
	 top: 0;
	 width: 75px;
	 height: 65px;
	 background-image: url('data:image/svg+xml;charset=US-ASCII,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%20standalone%3D%22no%22%3F%3E%3Csvg%20width%3D%2215px%22%20height%3D%2214px%22%20viewBox%3D%220%200%2015%2014%22%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%3E%20%20%20%20%3Ctitle%3EEmpty%20Star%3C%2Ftitle%3E%20%20%20%20%3Cdefs%3E%3C%2Fdefs%3E%20%20%20%20%3Cg%20id%3D%22Page-1%22%20stroke%3D%22none%22%20stroke-width%3D%221%22%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%20%20%20%20%20%20%20%20%3Cg%20id%3D%22Order-Details---Order-final---Not-reviewed%22%20transform%3D%22translate%28-108.000000%2C%20-385.000000%29%22%20fill%3D%22%23D5D5D5%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20id%3D%22Group%22%20transform%3D%22translate%28108.000000%2C%20316.000000%29%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20transform%3D%22translate%280.000000%2C%2069.000000%29%22%20id%3D%22Star-7%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpolygon%20points%3D%227.5%2011.25%203.09161061%2013.5676275%203.93353806%208.65881373%200.367076128%205.18237254%205.2958053%204.46618627%207.5%200%209.7041947%204.46618627%2014.6329239%205.18237254%2011.0664619%208.65881373%2011.9083894%2013.5676275%20%22%3E%3C%2Fpolygon%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%3C%2Fg%3E%3C%2Fsvg%3E');
	 background-size: auto 65px;
	 background-repeat: no-repeat;
	 cursor: pointer;
	 text-indent: 100%;
	 white-space: nowrap;
	 overflow: hidden;
}
 .ratingControl-stars:hover, .ratingControl-stars:hover ~ .ratingControl-stars, input:checked ~ .ratingControl-stars {
	 background-image: url('data:image/svg+xml;charset=US-ASCII,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%20standalone%3D%22no%22%3F%3E%3Csvg%20width%3D%2215px%22%20height%3D%2214px%22%20viewBox%3D%220%200%2015%2014%22%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%3E%20%20%20%20%3Ctitle%3ESolid%20Star%3C%2Ftitle%3E%20%20%20%20%3Cdefs%3E%3C%2Fdefs%3E%20%20%20%20%3Cg%20id%3D%22Page-1%22%20stroke%3D%22none%22%20stroke-width%3D%221%22%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%20%20%20%20%20%20%20%20%3Cg%20id%3D%22Order-Details---Order-final---Not-reviewed%22%20transform%3D%22translate%28-108.000000%2C%20-385.000000%29%22%20fill%3D%22%23FEC844%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20id%3D%22Group%22%20transform%3D%22translate%28108.000000%2C%20316.000000%29%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20transform%3D%22translate%280.000000%2C%2069.000000%29%22%20id%3D%22Star-7%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpolygon%20points%3D%227.5%2011.25%203.09161061%2013.5676275%203.93353806%208.65881373%200.367076128%205.18237254%205.2958053%204.46618627%207.5%200%209.7041947%204.46618627%2014.6329239%205.18237254%2011.0664619%208.65881373%2011.9083894%2013.5676275%20%22%3E%3C%2Fpolygon%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%3C%2Fg%3E%3C%2Fsvg%3E');
}
 .ratingControl-stars:active, .ratingControl-stars:active ~ .ratingControl-stars, input:checked ~ .ratingControl-stars:active {
	 background-image: url('data:image/svg+xml;charset=US-ASCII,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%20standalone%3D%22no%22%3F%3E%3Csvg%20width%3D%2215px%22%20height%3D%2214px%22%20viewBox%3D%220%200%2015%2014%22%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%3E%20%20%20%20%3Ctitle%3ESolid%20Star%20%E2%80%93%20Light%3C%2Ftitle%3E%20%20%20%20%3Cdefs%3E%3C%2Fdefs%3E%20%20%20%20%3Cg%20id%3D%22Page-1%22%20stroke%3D%22none%22%20stroke-width%3D%221%22%20fill%3D%22none%22%20fill-rule%3D%22evenodd%22%3E%20%20%20%20%20%20%20%20%3Cg%20id%3D%22Order-Details---Order-final---Not-reviewed%22%20transform%3D%22translate%28-108.000000%2C%20-385.000000%29%22%20fill%3D%22%23FFE39C%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20id%3D%22Group%22%20transform%3D%22translate%28108.000000%2C%20316.000000%29%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cg%20transform%3D%22translate%280.000000%2C%2069.000000%29%22%20id%3D%22Star-7%22%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3Cpolygon%20points%3D%227.5%2011.25%203.09161061%2013.5676275%203.93353806%208.65881373%200.367076128%205.18237254%205.2958053%204.46618627%207.5%200%209.7041947%204.46618627%2014.6329239%205.18237254%2011.0664619%208.65881373%2011.9083894%2013.5676275%20%22%3E%3C%2Fpolygon%3E%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%20%20%20%20%3C%2Fg%3E%20%20%20%20%3C%2Fg%3E%3C%2Fsvg%3E');
}
 .ratingControl-stars--05 {
	 left: 0px;
}
 .ratingControl-stars--1 {
	 left: 0px;
}
 .ratingControl-stars--15 {
	 left: 75px;
}
 .ratingControl-stars--2 {
	 left: 75px;
}
 .ratingControl-stars--25 {
	 left: 150px;
}
 .ratingControl-stars--3 {
	 left: 150px;
}
 .ratingControl-stars--35 {
	 left: 225px;
}
 .ratingControl-stars--4 {
	 left: 225px;
}
 .ratingControl-stars--45 {
	 left: 300px;
}
 .ratingControl-stars--5 {
	 left: 300px;
}
 .ratingControl-stars--half {
	 width: 34px;
}
 @font-face {
	 font-family: 'Audiowide';
	 font-style: normal;
	 font-weight: 400;
	 src: local('Audiowide'), local('Audiowide-Regular'), url(http://themes.googleusercontent.com/static/fonts/audiowide/v2/8XtYtNKEyyZh481XVWfVOj8E0i7KZn-EPnyo3HZu7kw.woff) format('woff');
}
 body {
	 font-size: 62.5%;
	 background-color: #fff;
	 margin: 10px;
	 border: 1px solid #333;
}
 h1, h2, h3 {
	 font-family: 'PT Sans', sans-serif;
	 text-transform: uppercase;
}
 h1 {
	 font-size: 2.4em;
	 background-color: rgba(41, 41, 41, 1);
	 text-align: center;
	 padding: 20px;
	 margin: 0;
	 color: #fff;
}
 h1 a {
	 display: block;
	 margin-top: 10px;
	 text-transform: none;
	 color: #aaa;
	 font-size: 16px;
	 text-decoration: none;
}
 .demo {
	 padding: 40px;
}

</style>
