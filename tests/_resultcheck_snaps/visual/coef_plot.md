# Snapshot: ggplot2::ggplot

## print

## str
<ggplot2::ggplot>
 @ data       :'data.frame':	8 obs. of  13 variables:
 .. $ outcome   : chr  "IMF loan to GDP ratio" "IMF loan to GDP ratio" "IMF participation rate" "IMF participation rate" ...
 .. $ term      : chr  "USA" "EUP" "USA" "EUP" ...
 .. $ estimate  : num  0.318 1.922 0.108 0.456 0.185 ...
 .. $ std.error : num  0.3052 0.5622 0.0641 0.1259 0.1667 ...
 .. $ conf.level: num  0.95 0.95 0.95 0.95 0.95 0.95 0.95 0.95
 .. $ conf.low  : num  -0.2807 0.8198 -0.0177 0.2093 -0.1413 ...
 .. $ conf.high : num  0.916 3.024 0.234 0.703 0.512 ...
 .. $ statistic : num  1.04 3.42 1.68 3.62 1.11 ...
 .. $ df.error  : num  Inf Inf Inf Inf Inf ...
 .. $ p.value   : num  0.298143 0.00063 0.092155 0.000292 0.265994 ...
 .. $ s.value   : chr  "1.7" "10.6" "3.4" "11.7" ...
 .. $ group     : chr  "" "" "" "" ...
 .. $ p_value   : Named num  0.0214 0.0214 0.0144 0.0144 0.1217 ...
 ..  ..- attr(*, "names")= chr [1:8] "IMF loan to GDP ratio" "IMF loan to GDP ratio" "IMF participation rate" "IMF participation rate" ...
 .. - attr(*, "sigma")= num(0) 
 .. - attr(*, "residual_df")= num 499
 .. - attr(*, "pretty_names")= Named chr [1:17] "(Intercept)" "us" "eu" "shstaffl" ...
 ..  ..- attr(*, "names")= chr [1:17] "(Intercept)" "us" "eu" "shstaffl" ...
 .. - attr(*, "ci")= num 0.95
 .. - attr(*, "ci_method")= chr "Wald"
 .. - attr(*, "df_method")= chr "Wald"
 .. - attr(*, "verbose")= logi FALSE
 .. - attr(*, "exponentiate")= logi FALSE
 .. - attr(*, "ordinal_model")= logi FALSE
 .. - attr(*, "linear_model")= logi TRUE
 .. - attr(*, "mixed_model")= logi FALSE
 .. - attr(*, "n_obs")= int 517
 .. - attr(*, "model_class")= chr [1:2] "tobit" "survreg"
 .. - attr(*, "bootstrap")= logi FALSE
 .. - attr(*, "iterations")= num 1000
 .. - attr(*, "robust_vcov")= logi FALSE
 .. - attr(*, "ignore_group")= logi TRUE
 .. - attr(*, "ran_pars")= logi TRUE
 .. - attr(*, "show_summary")= logi FALSE
 .. - attr(*, "log_link")= logi FALSE
 .. - attr(*, "logit_link")= logi FALSE
 .. - attr(*, "model_call")= language tobit(formula = imfloannew100 ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew +      rgdpch| __truncated__ ...
 .. - attr(*, "test_statistic")= chr "z-statistic"
 .. - attr(*, "log_response")= logi FALSE
 .. - attr(*, "log_predictors")= logi FALSE
 .. - attr(*, "weighted_nobs")= num 517
 .. - attr(*, "model_formula")= chr "imfloannew100 ~ us + eu + shstaffl + shquotal + lnrgdpnew + lnrgdpnewsq + rgdpchnew + rgdpchnewsquare + growth1"| __truncated__
 .. - attr(*, "coefficient_name")= chr "Coefficient"
 .. - attr(*, "zi_coefficient_name")= chr "Log-Odds"
 .. - attr(*, "digits")= num 2
 .. - attr(*, "p_digits")= num 3
 .. - attr(*, "footer_digits")= num 3
 .. - attr(*, "pretty_labels")= Named chr [1:17] "(Intercept)" "us" "eu" "lagged  nationals employed as IMF economists" ...
 ..  ..- attr(*, "names")= chr [1:17] "(Intercept)" "us" "eu" "shstaffl" ...
 .. - attr(*, "backend")= chr "parameters"
 @ layers     :List of 4
 .. $ geom_point   :Classes 'LayerInstance', 'Layer', 'ggproto', 'gg' <ggproto object: Class LayerInstance, Layer, gg>
    aes_params: list
    compute_aesthetics: function
    compute_geom_1: function
    compute_geom_2: function
    compute_position: function
    compute_statistic: function
    computed_geom_params: list
    computed_mapping: ggplot2::mapping, uneval, gg, S7_object
    computed_stat_params: list
    constructor: call
    data: waiver
    draw_geom: function
    finish_statistics: function
    geom: <ggproto object: Class GeomPoint, Geom, gg>
        aesthetics: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        draw_group: function
        draw_key: function
        draw_layer: function
        draw_panel: function
        extra_params: na.rm
        handle_na: function
        non_missing_aes: size shape colour
        optional_aes: 
        parameters: function
        rename_size: FALSE
        required_aes: x y
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Geom, gg>
    geom_params: list
    inherit.aes: TRUE
    layer_data: function
    layout: NULL
    map_statistic: function
    mapping: NULL
    name: NULL
    position: <ggproto object: Class PositionDodge, Position, gg>
        aesthetics: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        orientation: x
        preserve: total
        required_aes: 
        reverse: FALSE
        setup_data: function
        setup_params: function
        use_defaults: function
        width: 0.4
        super:  <ggproto object: Class PositionDodge, Position, gg>
    print: function
    setup_layer: function
    show.legend: NA
    stat: <ggproto object: Class StatIdentity, Stat, gg>
        aesthetics: function
        compute_group: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        dropped_aes: 
        extra_params: na.rm
        finish_layer: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        required_aes: 
        retransform: TRUE
        setup_data: function
        setup_params: function
        super:  <ggproto object: Class Stat, gg>
    stat_params: list
    super:  <ggproto object: Class Layer, gg> 
 .. $ geom_hline   :Classes 'LayerInstance', 'Layer', 'ggproto', 'gg' <ggproto object: Class LayerInstance, Layer, gg>
    aes_params: list
    compute_aesthetics: function
    compute_geom_1: function
    compute_geom_2: function
    compute_position: function
    compute_statistic: function
    computed_geom_params: list
    computed_mapping: ggplot2::mapping, uneval, gg, S7_object
    computed_stat_params: list
    constructor: call
    data: data.frame
    draw_geom: function
    finish_statistics: function
    geom: <ggproto object: Class GeomHline, Geom, gg>
        aesthetics: function
        check_constant_aes: FALSE
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        draw_group: function
        draw_key: function
        draw_layer: function
        draw_panel: function
        extra_params: na.rm
        handle_na: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        rename_size: TRUE
        required_aes: yintercept
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Geom, gg>
    geom_params: list
    inherit.aes: FALSE
    layer_data: function
    layout: NULL
    map_statistic: function
    mapping: ggplot2::mapping, uneval, gg, S7_object
    name: NULL
    position: <ggproto object: Class PositionIdentity, Position, gg>
        aesthetics: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        required_aes: 
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Position, gg>
    print: function
    setup_layer: function
    show.legend: FALSE
    stat: <ggproto object: Class StatIdentity, Stat, gg>
        aesthetics: function
        compute_group: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        dropped_aes: 
        extra_params: na.rm
        finish_layer: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        required_aes: 
        retransform: TRUE
        setup_data: function
        setup_params: function
        super:  <ggproto object: Class Stat, gg>
    stat_params: list
    super:  <ggproto object: Class Layer, gg> 
 .. $ geom_errorbar:Classes 'LayerInstance', 'Layer', 'ggproto', 'gg' <ggproto object: Class LayerInstance, Layer, gg>
    aes_params: list
    compute_aesthetics: function
    compute_geom_1: function
    compute_geom_2: function
    compute_position: function
    compute_statistic: function
    computed_geom_params: list
    computed_mapping: ggplot2::mapping, uneval, gg, S7_object
    computed_stat_params: list
    constructor: call
    data: waiver
    draw_geom: function
    finish_statistics: function
    geom: <ggproto object: Class GeomErrorbar, Geom, gg>
        aesthetics: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        draw_group: function
        draw_key: function
        draw_layer: function
        draw_panel: function
        extra_params: na.rm orientation height
        handle_na: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        rename_size: TRUE
        required_aes: x|y ymin|xmin ymax|xmax
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Geom, gg>
    geom_params: list
    inherit.aes: TRUE
    layer_data: function
    layout: NULL
    map_statistic: function
    mapping: ggplot2::mapping, uneval, gg, S7_object
    name: NULL
    position: <ggproto object: Class PositionDodge, Position, gg>
        aesthetics: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        orientation: x
        preserve: total
        required_aes: 
        reverse: FALSE
        setup_data: function
        setup_params: function
        use_defaults: function
        width: 0.4
        super:  <ggproto object: Class PositionDodge, Position, gg>
    print: function
    setup_layer: function
    show.legend: NA
    stat: <ggproto object: Class StatIdentity, Stat, gg>
        aesthetics: function
        compute_group: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        dropped_aes: 
        extra_params: na.rm
        finish_layer: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        required_aes: 
        retransform: TRUE
        setup_data: function
        setup_params: function
        super:  <ggproto object: Class Stat, gg>
    stat_params: list
    super:  <ggproto object: Class Layer, gg> 
 .. $ geom_signif  :Classes 'LayerInstance', 'Layer', 'ggproto', 'gg' <ggproto object: Class LayerInstance, Layer, gg>
    aes_params: list
    compute_aesthetics: function
    compute_geom_1: function
    compute_geom_2: function
    compute_position: function
    compute_statistic: function
    computed_geom_params: list
    computed_mapping: ggplot2::mapping, uneval, gg, S7_object
    computed_stat_params: list
    constructor: call
    data: tbl_df, tbl, data.frame
    draw_geom: function
    finish_statistics: function
    geom: <ggproto object: Class GeomSignif, Geom, gg>
        aesthetics: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        draw_group: function
        draw_key: function
        draw_layer: function
        draw_panel: function
        extra_params: na.rm orientation
        handle_na: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        rename_size: FALSE
        required_aes: x xend y yend annotation
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Geom, gg>
    geom_params: list
    inherit.aes: FALSE
    layer_data: function
    layout: NULL
    map_statistic: function
    mapping: ggplot2::mapping, uneval, gg, S7_object
    name: NULL
    position: <ggproto object: Class PositionIdentity, Position, gg>
        aesthetics: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        required_aes: 
        setup_data: function
        setup_params: function
        use_defaults: function
        super:  <ggproto object: Class Position, gg>
    print: function
    setup_layer: function
    show.legend: NA
    stat: <ggproto object: Class StatSignif, Stat, gg>
        aesthetics: function
        compute_group: function
        compute_layer: function
        compute_panel: function
        default_aes: ggplot2::mapping, uneval, gg, S7_object
        dropped_aes: 
        extra_params: na.rm orientation
        finish_layer: function
        non_missing_aes: 
        optional_aes: 
        parameters: function
        required_aes: x y group
        retransform: TRUE
        setup_data: function
        setup_params: function
        super:  <ggproto object: Class Stat, gg>
    stat_params: list
    super:  <ggproto object: Class Layer, gg> 
 @ scales     :Classes 'ScalesList', 'ggproto', 'gg' <ggproto object: Class ScalesList, gg>
    add: function
    add_defaults: function
    add_missing: function
    backtransform_df: function
    clone: function
    find: function
    get_scales: function
    has_scale: function
    input: function
    map_df: function
    n: function
    non_position_scales: function
    scales: list
    set_palettes: function
    train_df: function
    transform_df: function
    super:  <ggproto object: Class ScalesList, gg> 
 @ guides     :Classes 'Guides', 'ggproto', 'gg' <ggproto object: Class Guides, gg>
    add: function
    assemble: function
    build: function
    draw: function
    get_custom: function
    get_guide: function
    get_params: function
    get_position: function
    guides: NULL
    merge: function
    missing: <ggproto object: Class GuideNone, Guide, gg>
        add_title: function
        arrange_layout: function
        assemble_drawing: function
        available_aes: any
        build_decor: function
        build_labels: function
        build_ticks: function
        build_title: function
        draw: function
        draw_early_exit: function
        elements: list
        extract_decor: function
        extract_key: function
        extract_params: function
        get_layer_key: function
        hashables: list
        measure_grobs: function
        merge: function
        override_elements: function
        params: list
        process_layers: function
        setup_elements: function
        setup_params: function
        train: function
        transform: function
        super:  <ggproto object: Class GuideNone, Guide, gg>
    package_box: function
    print: function
    process_layers: function
    setup: function
    subset_guides: function
    train: function
    update_params: function
    super:  <ggproto object: Class Guides, gg> 
 @ mapping    : <ggplot2::mapping> List of 2
 .. $ x: language ~term
 ..  ..- attr(*, ".Environment")=<environment: <normalized>> 
 .. $ y: language ~estimate
 ..  ..- attr(*, ".Environment")=<environment: <normalized>> 
 @ theme      : <theme> List of 144
 .. $ line                            : <ggplot2::element_line>
 ..  ..@ colour       : chr "black"
 ..  ..@ linewidth    : num 0.5
 ..  ..@ linetype     : num 1
 ..  ..@ lineend      : chr "butt"
 ..  ..@ linejoin     : chr "round"
 ..  ..@ arrow        : logi FALSE
 ..  ..@ arrow.fill   : chr "black"
 ..  ..@ inherit.blank: logi TRUE
 .. $ rect                            : <ggplot2::element_rect>
 ..  ..@ fill         : chr "white"
 ..  ..@ colour       : chr "black"
 ..  ..@ linewidth    : num 0.5
 ..  ..@ linetype     : num 1
 ..  ..@ linejoin     : chr "round"
 ..  ..@ inherit.blank: logi TRUE
 .. $ text                            : <ggplot2::element_text>
 ..  ..@ family       : chr ""
 ..  ..@ face         : chr "plain"
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : chr "black"
 ..  ..@ size         : num 11
 ..  ..@ hjust        : num 0.5
 ..  ..@ vjust        : num 0.5
 ..  ..@ angle        : num 0
 ..  ..@ lineheight   : num 0.9
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 0 0 0 0
 ..  ..@ debug        : logi FALSE
 ..  ..@ inherit.blank: logi TRUE
 .. $ title                           : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : NULL
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : NULL
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ point                           : <ggplot2::element_point>
 ..  ..@ colour       : chr "black"
 ..  ..@ shape        : num 19
 ..  ..@ size         : num 1.5
 ..  ..@ fill         : chr "white"
 ..  ..@ stroke       : num 0.5
 ..  ..@ inherit.blank: logi TRUE
 .. $ polygon                         : <ggplot2::element_polygon>
 ..  ..@ fill         : chr "white"
 ..  ..@ colour       : chr "black"
 ..  ..@ linewidth    : num 0.5
 ..  ..@ linetype     : num 1
 ..  ..@ linejoin     : chr "round"
 ..  ..@ inherit.blank: logi TRUE
 .. $ geom                            : <ggplot2::element_geom>
 ..  ..@ ink        : chr "black"
 ..  ..@ paper      : chr "white"
 ..  ..@ accent     : chr "#3366FF"
 ..  ..@ linewidth  : num 0.5
 ..  ..@ borderwidth: num 0.5
 ..  ..@ linetype   : int 1
 ..  ..@ bordertype : int 1
 ..  ..@ family     : chr ""
 ..  ..@ fontsize   : num 3.87
 ..  ..@ pointsize  : num 1.5
 ..  ..@ pointshape : num 19
 ..  ..@ colour     : NULL
 ..  ..@ fill       : NULL
 .. $ spacing                         : 'simpleUnit' num 5.5points
 ..  ..- attr(*, "unit")= int 8
 .. $ margins                         : <ggplot2::margin> num [1:4] 5.5 5.5 5.5 5.5
 .. $ aspect.ratio                    : NULL
 .. $ axis.title                      : NULL
 .. $ axis.title.x                    : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : num 1
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 2.75 0 0 0
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.title.x.top                : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : num 0
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 0 0 2.75 0
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.title.x.bottom             : NULL
 .. $ axis.title.y                    : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : num 1
 ..  ..@ angle        : num 90
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 0 2.75 0 0
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.title.y.left               : NULL
 .. $ axis.title.y.right              : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : num 1
 ..  ..@ angle        : num -90
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 0 0 0 2.75
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.text                       : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : chr "#4D4D4DFF"
 ..  ..@ size         : 'rel' num 0.8
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : NULL
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : NULL
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.text.x                     : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : num 1
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 2.2 0 0 0
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.text.x.top                 : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : num 0
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 0 0 2.2 0
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.text.x.bottom              : NULL
 .. $ axis.text.y                     : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : num 1
 ..  ..@ vjust        : NULL
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 0 2.2 0 0
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.text.y.left                : NULL
 .. $ axis.text.y.right               : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : num 0
 ..  ..@ vjust        : NULL
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 0 0 0 2.2
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.text.theta                 : NULL
 .. $ axis.text.r                     : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : num 0.5
 ..  ..@ vjust        : NULL
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : <ggplot2::margin> num [1:4] 0 2.2 0 2.2
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.ticks                      : <ggplot2::element_line>
 ..  ..@ colour       : chr "#333333FF"
 ..  ..@ linewidth    : NULL
 ..  ..@ linetype     : NULL
 ..  ..@ lineend      : NULL
 ..  ..@ linejoin     : NULL
 ..  ..@ arrow        : logi FALSE
 ..  ..@ arrow.fill   : chr "#333333FF"
 ..  ..@ inherit.blank: logi TRUE
 .. $ axis.ticks.x                    : NULL
 .. $ axis.ticks.x.top                : NULL
 .. $ axis.ticks.x.bottom             : NULL
 .. $ axis.ticks.y                    : NULL
 .. $ axis.ticks.y.left               : NULL
 .. $ axis.ticks.y.right              : NULL
 .. $ axis.ticks.theta                : NULL
 .. $ axis.ticks.r                    : NULL
 .. $ axis.minor.ticks.x.top          : NULL
 .. $ axis.minor.ticks.x.bottom       : NULL
 .. $ axis.minor.ticks.y.left         : NULL
 .. $ axis.minor.ticks.y.right        : NULL
 .. $ axis.minor.ticks.theta          : NULL
 .. $ axis.minor.ticks.r              : NULL
 .. $ axis.ticks.length               : 'rel' num 0.5
 .. $ axis.ticks.length.x             : NULL
 .. $ axis.ticks.length.x.top         : NULL
 .. $ axis.ticks.length.x.bottom      : NULL
 .. $ axis.ticks.length.y             : NULL
 .. $ axis.ticks.length.y.left        : NULL
 .. $ axis.ticks.length.y.right       : NULL
 .. $ axis.ticks.length.theta         : NULL
 .. $ axis.ticks.length.r             : NULL
 .. $ axis.minor.ticks.length         : 'rel' num 0.75
 .. $ axis.minor.ticks.length.x       : NULL
 .. $ axis.minor.ticks.length.x.top   : NULL
 .. $ axis.minor.ticks.length.x.bottom: NULL
 .. $ axis.minor.ticks.length.y       : NULL
 .. $ axis.minor.ticks.length.y.left  : NULL
 .. $ axis.minor.ticks.length.y.right : NULL
 .. $ axis.minor.ticks.length.theta   : NULL
 .. $ axis.minor.ticks.length.r       : NULL
 .. $ axis.line                       : <ggplot2::element_blank>
 .. $ axis.line.x                     : NULL
 .. $ axis.line.x.top                 : NULL
 .. $ axis.line.x.bottom              : NULL
 .. $ axis.line.y                     : NULL
 .. $ axis.line.y.left                : NULL
 .. $ axis.line.y.right               : NULL
 .. $ axis.line.theta                 : NULL
 .. $ axis.line.r                     : NULL
 .. $ legend.background               : <ggplot2::element_rect>
 ..  ..@ fill         : NULL
 ..  ..@ colour       : logi NA
 ..  ..@ linewidth    : NULL
 ..  ..@ linetype     : NULL
 ..  ..@ linejoin     : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ legend.margin                   : NULL
 .. $ legend.spacing                  : 'rel' num 2
 .. $ legend.spacing.x                : NULL
 .. $ legend.spacing.y                : NULL
 .. $ legend.key                      : NULL
 .. $ legend.key.size                 : 'simpleUnit' num 1.2lines
 ..  ..- attr(*, "unit")= int 3
 .. $ legend.key.height               : NULL
 .. $ legend.key.width                : NULL
 .. $ legend.key.spacing              : NULL
 .. $ legend.key.spacing.x            : NULL
 .. $ legend.key.spacing.y            : NULL
 .. $ legend.key.justification        : NULL
 .. $ legend.frame                    : NULL
 .. $ legend.ticks                    : NULL
 .. $ legend.ticks.length             : 'rel' num 0.2
 .. $ legend.axis.line                : NULL
 .. $ legend.text                     : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : 'rel' num 0.8
 ..  ..@ hjust        : NULL
 ..  ..@ vjust        : NULL
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : NULL
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ legend.text.position            : NULL
 .. $ legend.title                    : <ggplot2::element_text>
 ..  ..@ family       : NULL
 ..  ..@ face         : NULL
 ..  ..@ italic       : chr NA
 ..  ..@ fontweight   : num NA
 ..  ..@ fontwidth    : num NA
 ..  ..@ colour       : NULL
 ..  ..@ size         : NULL
 ..  ..@ hjust        : num 0
 ..  ..@ vjust        : NULL
 ..  ..@ angle        : NULL
 ..  ..@ lineheight   : NULL
 ..  ..@ margin       : NULL
 ..  ..@ debug        : NULL
 ..  ..@ inherit.blank: logi TRUE
 .. $ legend.title.position           : NULL
 .. $ legend.position                 : chr "right"
 .. $ legend.position.inside          : NULL
 .. $ legend.direction                : NULL
 .. $ legend.byrow                    : NULL
 .. $ legend.justification            : chr "center"
 .. $ legend.justification.top        : NULL
 .. $ legend.justification.bottom     : NULL
 .. $ legend.justification.left       : NULL
 .. $ legend.justification.right      : NULL
 .. $ legend.justification.inside     : NULL
 ..  [list output truncated]
 .. @ complete: logi TRUE
 .. @ validate: logi TRUE
 @ coordinates:Classes 'CoordFlip', 'CoordCartesian', 'Coord', 'ggproto', 'gg' <ggproto object: Class CoordFlip, CoordCartesian, Coord, gg>
    aspect: function
    backtransform_range: function
    clip: on
    default: FALSE
    distance: function
    draw_panel: function
    expand: TRUE
    is_free: function
    is_linear: function
    labels: function
    limits: list
    modify_scales: function
    range: function
    render_axis_h: function
    render_axis_v: function
    render_bg: function
    render_fg: function
    reverse: none
    setup_data: function
    setup_layout: function
    setup_panel_guides: function
    setup_panel_params: function
    setup_params: function
    train_panel_guides: function
    transform: function
    super:  <ggproto object: Class CoordFlip, CoordCartesian, Coord, gg> 
 @ facet      :Classes 'FacetWrap', 'Facet', 'ggproto', 'gg' <ggproto object: Class FacetWrap, Facet, gg>
    attach_axes: function
    attach_strips: function
    compute_layout: function
    draw_back: function
    draw_front: function
    draw_labels: function
    draw_panel_content: function
    draw_panels: function
    finish_data: function
    format_strip_labels: function
    init_gtable: function
    init_scales: function
    map_data: function
    params: list
    set_panel_size: function
    setup_data: function
    setup_panel_params: function
    setup_params: function
    shrink: TRUE
    train_scales: function
    vars: function
    super:  <ggproto object: Class FacetWrap, Facet, gg> 
 @ layout     :Classes 'Layout', 'ggproto', 'gg' <ggproto object: Class Layout, gg>
    coord: NULL
    coord_params: list
    facet: NULL
    facet_params: list
    finish_data: function
    get_scales: function
    layout: NULL
    map_position: function
    panel_params: NULL
    panel_scales_x: NULL
    panel_scales_y: NULL
    render: function
    render_labels: function
    reset_scales: function
    resolve_label: function
    setup: function
    setup_panel_guides: function
    setup_panel_params: function
    train_position: function
    super:  <ggproto object: Class Layout, gg> 
 @ labels     : <ggplot2::labels> List of 3
 .. $ y    : chr "Coefficient"
 .. $ x    : NULL
 .. $ shape: NULL
 @ meta       : list()
 @ plot_env   :<environment: <normalized>> 
