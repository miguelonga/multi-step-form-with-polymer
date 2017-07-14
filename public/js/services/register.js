Class('Services.Register', {

    Extends: Service,

    initialize: function() {
        Services.Register.Super.call(this, '/api');
    },

    register: function(data) {
      Bus.publish('registered', data)
    },

    subscribe: function() {
      Bus.subscribe('register', this.register.bind(this))
    }
})
