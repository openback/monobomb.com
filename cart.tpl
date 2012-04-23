{% if cart.items != blank %}
<form id="cart_form" method="post" action="/cart">
	<table class="contents">
		<thead>
			<tr>
				<th class="thumbnail"><span class="eye">Thumbnail</span>
				<th>Item #
				<th>Price
				<th>Qty.
				<th>Subtotal
				<th><span class="delete">Remove</span>
		<tbody>
    {% for item in cart.items %}
			<tr{% if forloop.last %} class="last"{% endif %}>
				<td class="thumbnail"><a href="{{ item.product.url }}"><img src="{{ item.product.image | product_image_url: "thumb" }}" alt="Image of {{ item.product.name | escape }}" width="75" height="75"></a>
				<td{% if item.product.has_default_option %} class="optionless"{% endif %}>{{ item.product.name }} {% unless item.product.has_default_option %} <span class="option">({{ item.option.name }})</span>{% endunless %}
				<td>{{ item.unit_price | money_with_sign }}
				<td><div class="input"><input type="text" autocomplete="off" id="item_{{ item.id }}_qty" name="cart[update][{{ item.id }}]" value="{{ item.quantity }}"></div>
				<td>{{ item.proce | money_with_sign }}
				<td><a href="#" class="delete" title="Remove item" onclick="Store.removeItem({{ item.id }}); return false;">Remove</a>
	{% endfor %}
	{% if cart.discount.enabled %}
		<div id="cart_discount" class="clearfix">
		<h2>Discount:</h2>
		{% if cart.discount.pending %}
		<div id="discount_entry">{{ cart.discount | discount_code_input }}</div>
		<div id="discount_total">optional</div>
		{% elsif cart.discount.free_shipping %}
		<div id="discount_entry" style="display:none"></div>
		<div id="discount_total" class="shipping">{{ cart.discount.name }}</div>
		{% else %}
		<div id="discount_entry">{{ cart.discount.name }}</div>
		<div id="discount_total">{{ cart.discount.amount | money_with_sign }}</div>
		{% endif %}
		</div>
	{% endif %}
	{% if cart.shipping.enabled %}
			<tr class="separate">
				{% if cart.shipping.strict %}</div>
				<td class="shipping-to">Shipping to:
				<td colspan="2">{{ store.country | country_select }}
				{% else %}
				<td colspan="3">
				{% endif %}
				{% if cart.shipping.pending %}
				<td colspan="2">
				{% else %}
				<td class="shipping">Shipping
				<td>{{ cart.shipping.amount | money_with_sign }}
				{% endif %}
				<td>
	{% endif %}
			<tr>
				<td colspan="4" class="total">Total
				<td>{{ cart.total | money_with_sign }}
				<td>{% unless cart.shipping.enabled %}+ S/H{% endunless %}
	</table>
	<input type="submit" name="checkout" class="checkout button" value="Checkout">
	<input type="submit" name="update"   class="update button"   value="Update Totals">
	<input type="submit" name="continue" class="continue button" value="Continue Shopping" onclick="location.href='http://monobomb.bigcartel.com'">
</form>
{% else %}
<div id="cart_empty">
  <h2>You don&#8217;t have any items in your cart.</h2>
  <p>Sounds like a good time to <a href="/">start shopping</a>.</p>
</div>
{% endif %}
