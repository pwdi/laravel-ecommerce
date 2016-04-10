<ul class="list-unstyled list-split-hr">
    @foreach ($products as $product)
        <li>
            {{ $product->{'colors'} }} ${{ $product->price }}
            <pre>{{ $product }}</pre>
        </li>
    @endforeach
</ul>
{{ var_dump(DB::getQueryLog()) }}
<?php $renderer = \Debugbar::getJavascriptRenderer(); ?>
<?php echo $renderer->render() ?>