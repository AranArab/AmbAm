new Vue({
    el: '#app',
    data() {
        return {
            msg: 'Howdy!',
            name: '',
            address: '',
            phone: '',
            status: ''
        }
    },

    mounted() {        
    },
    methods: {
        submitData () {
            //console.log("working here")
            // axios
            //     .get('https://api.coindesk.com/v1/bpi/currentprice.json')
            //     .then(response => (this.message = response.data.chartName))
            
            axios
                .post('http://localhost:3606/api/signup', {Person_fname: this.Person_fname, Person_lname: this.Person_lname, phone_number: this.phone_number, Email: this.Email, 
            Username: this.Username, P_word: this.P_word, Diet: this.Diet})
                .then(response => (
                    this.status = response.data.status,
                    (this.status == 'success') ? window.location = "signup.html" : this.msg = 'Added! Thanks.' : 'Ooops!'                                     
                    )
                )                                 
                // .then(() => ((this.msg == 'success')?this.status = 'Submitted! Thanks.':''))
                // .then(
                //     (this.msg == 'success') ? this.status = 'Submitted! Thanks.' : '',
                //     console.log('then ...')
                // )
                .catch(function (error) {
                    console.log(error);
                })
            
        }
    }
})