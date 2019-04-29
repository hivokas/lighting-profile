<?php

if (! function_exists('appropriate_mix')) {
    function appropriate_mix($path)
    {
        $old = !str_contains(request()->userAgent(), 'GoNativeAndroid');

        return mix(($old ? '' : 'fresh/').$path);
    }
}
