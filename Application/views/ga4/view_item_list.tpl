[{assign var="gtmProducts" value=$products}]

[{if $gtmProducts|@count}]
[{strip}]
    <script>
        /* ga4 */
        dataLayer.push({ecommerce: null});
        dataLayer.push({
            'event':'view_item_list',
            'event_name': 'view_item_list',
            'ecommerce': {
                'items': [
                    [{foreach from=$gtmProducts name="gtmProducts" item="gtmProduct"}]
                    [{assign var="gtmManufacturer" value=$gtmProduct->getManufacturer()}]
                    [{if !$gtmCategory}][{assign var="gtmCategory" value=$gtmProduct->getCategory()}][{/if}]
                    {
                        'item_id': '[{$gtmProduct->getFieldData("oxartnum")}]',
                        'item_name': '[{$gtmProduct->getFieldData("oxtitle")}]',
                        'price': [{$gtmProduct->oxarticles__oxprice->value|default:'0'}],
                        'item_brand': '[{if $gtmManufacturer}][{$gtmManufacturer->oxmanufacturers__oxtitle->value}][{/if}]',
                        'item_category': '[{if $gtmCategory}][{$gtmCategory->getLink()|parse_url:5|ltrim:"/"|rtrim:"/"}][{else}]-[{/if}]',
                        'quantity': 1
                    }[{if !$smarty.foreach.gtmProducts.last}],[{/if}]
                    [{/foreach}]
                ]
            }
        });
    </script>
[{/strip}]
[{/if}]