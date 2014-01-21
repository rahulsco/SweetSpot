SS.Views.RestaurantShow = Backbone.View.extend({
  template: JST['restaurants/show'],
  tagName: 'ul',

  initialize: function () {
		this.review = new SS.Models.Review();
    this.listenTo(this.review, 'save', this.render);
  },

	events: {
		'click #submit-review': 'submit'
	},

  render: function () {
    var that = this;
    that.$el.html(that.template({
      restaurant: that.model
    }));
    return this;
  },

	submit: function (event) {
		var that = this;
		event.preventDefault();
		var data = $('#review-form').serializeJSON();
		this.review.save(data, {
			success: function () {
				var showForm = new SS.Views.ReviewShow({ model: that.review })
				that.$('#review-section').append(showForm.render().$el);
				that.$('')
			}
		});
	},

});
