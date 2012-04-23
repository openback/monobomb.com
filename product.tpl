<form id="product_form" method="post" action="/cart">
	<div id="photos">
		{% for image in product.images %}<a href="{{ image | product_image_url }}" class="photo"><div class="zoom"></div><img src="{{ image | product_image_url size:"large" }}" alt="Image of {{ product.name }}" width="300" height="300"></a>{% endfor %}
	</div>
	<div id="details">
		<div id="info">
			<h1><span class="sku"></span> <span class="name">{{ product.name }}</span></h1>
			{% if product.description != blank %}
			<div class="description">
			  {{ product.description | paragraphs }}
			</div>
			{% endif %}
		</div>
		<div id="buy">
			<h2 class="price">{{ product.default_price | money_with_sign }}{% if product.on_sale %} <span class="on_sale">On Sale!</span>{% endif %}</h2>
			{% if product.has_default_option %}
			{{ product.option | hidden_option_input }}
			{% else %}
			<div class="options">
				{% for option in product.options %}<input type="radio" name="cart[add][id]" id="{{ option.id }}" value="{{ option.id }}"><label for="{{ option.id }}">{{option.name}}</label>{% endfor %}
			</div>
			{% endif %}
			{% for category in product.categories %}
				{% if category.name == 'Tees' %}
			<div class="sizing"><a href="http://monobomb.com/shop/images/size_information.png">View</a> Size Information</div>
				{% endif %}
			{% endfor %}
			<input class="add-to-cart" name="submit" type="submit" value="+ Add to cart">
		</div>
	</div>
</form>
<script>
	$j(document).ready(function () {
		var $radios = $j('input[type="radio"]');

		$j('#product_form').on('submit', function (e) {
			if (($radios.length !== 0) && ($j('input[type="radio"]:checked').length === 0)) {
				e.preventDefault();
				alert('You must select a size');
				return false;
			}
		});
	});
</script>
