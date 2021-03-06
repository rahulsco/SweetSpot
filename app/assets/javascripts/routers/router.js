SS.Routers.Router = Backbone.Router.extend({
	initialize: function (restaurants, $rootEl) {
		this.$rootEl = $rootEl;
		this.restaurants = restaurants;
	},

	routes: {
		"": "index",
    "search=:query": "search",
		"restaurant/:id": "show",
		"restaurants/new": "new",
    "category/:type": "categoryIndex"
	},

	search: function(query){
		var that = this;
		var indexView = new SS.Views.RestaurantsIndex({
			collection: that.restaurants,
      queryString: query
		});
		that._swapView(indexView);
	},

	index: function(){
		var that = this;
		var indexView = new SS.Views.RestaurantsIndex({
			collection: that.restaurants,
      queryString: "Desserts!"
		});
		that._swapView(indexView);
	},

	categoryIndex: function(type){
		var that = this;
    
		var indexView = new SS.Views.RestaurantsIndex({
			collection: that.restaurants.byType(type),
      queryString: type
		});
		that._swapView(indexView);
	},

	show: function (id) {
		var that = this;

		if (typeof that.restaurants.get(id) === 'undefined'){
			var restaurant = new SS.Models.Restaurant();
			restaurant.set({'id':id});
			restaurant.fetch ({
				success: function () {
					var showView = new SS.Views.RestaurantShow({
						model: restaurant,
						collection: that.restaurants
					});
					that._swapView(showView);
				}
			});
		} else {
			var restaurant = that.restaurants.get(id);
			var showView = new SS.Views.RestaurantShow({
				model: restaurant
			});
			that._swapView(showView);
		}
	},

	new: function () {
		var newView = new SS.Views.RestaurantNew({
			model: new SS.Models.Restaurant(),
			collection: this.restaurants
		});

		this._swapView(newView);
	},

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

})