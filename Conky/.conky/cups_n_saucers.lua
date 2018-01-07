---
--======================================================================
--                         Cups and Saucers
--                         Lua conky script
--
--  author : Abu Yahya
--  edited : Norman Sue
--  license : Distributed under the terms of GNU GPL v3
--  January 10, 2013
--  v.1.0.1
--  edited : Cbuntu 2014/2/17 China hangzhou
--=======================================================================
require 'cairo'

------------------------------------------------------------------------
------------------------ Adjustable Settings ---------------------------
------------------------------------------------------------------------

coffee_table = {
    {
    name='hour_hand',              arg='%I.%M',            max_value=12,
    x=200,                         y=200,
    cup_radius=59,
    cup_wall_thickness=12,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=136,             handle_circ=1.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=1.0,
    graduation_radius=128,
    graduation_thickness=8,        graduation_mark_circ=0.2,
    graduation_mark_angle=360/(12*6),
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=1.0,
    saucer_thickness=8,            thick_saucer_circ=11/12,
    saucer_radius=140,             thin_saucer_circ=11/12,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.0,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.0,
    inner_saucer=true,
    xtxt=0,                        ytxt=0,
    txt_weight=0,                  txt_size=12.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=0.0,
    caption='',                    caption2='',
    txt_font='serif',
    },
    {
    name='minute_text',            arg='%H.%M',            max_value=12,
    x=200,                         y=200,
    cup_radius=59,
    cup_wall_thickness=12,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=123,             handle_circ=1.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    graduation_radius=128,
    graduation_thickness=8,        graduation_mark_circ=1.0,
    graduation_mark_angle=360/12,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.8,
    saucer_thickness=8,            thick_saucer_circ=11/12,
    saucer_radius=140,             thin_saucer_circ=11/12,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.0,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.0,
    inner_saucer=true,
    xtxt=0,                        ytxt=0,
    txt_weight=0,                  txt_size=30.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='',                    caption2='',
    txt_font='serif',
    },
    {
    name='time',                   arg='%S',               max_value=60,
    x=200,                         y=200,
    cup_radius=0,
    cup_wall_thickness=120,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=118,             handle_circ=1.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=1.0,
    graduation_radius=132,
    graduation_thickness=8,        graduation_mark_circ=0.0,
    graduation_mark_angle=360/60,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=8,            thick_saucer_circ=1.0,
    saucer_radius=135,             thin_saucer_circ=1.0,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.3,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
    inner_saucer=false,
    xtxt=0,                        ytxt=0,
    txt_weight=0,                  txt_size=20.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='',                    caption2='',
    txt_font='serif'
    },
    {
    name='minute_of_week',         arg='%w.%H.%M',          max_value=7,
    x=200,                         y=200,
    cup_radius=55,
    cup_wall_thickness=120,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=0,               handle_circ=1.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    graduation_radius=145,
    graduation_thickness=8,        graduation_mark_circ=0.3,
    graduation_mark_angle=360/7,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.5,
    saucer_thickness=8,            thick_saucer_circ=0.0,
    saucer_radius=145,             thin_saucer_circ=1.0,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.3,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
    inner_saucer=true,
    xtxt=0,                        ytxt=0,
    txt_weight=0,                  txt_size=30.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=0.0,
    caption='',                    caption2='',
    txt_font='serif',
    },
    {
    name='minute_of_week',         arg='%w.%H.%M',          max_value=7,
    x=200,                         y=200,
    cup_radius=55,
    cup_wall_thickness=120,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=0,               handle_circ=1.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    graduation_radius=143,
    graduation_thickness=2,        graduation_mark_circ=0.3,
    graduation_mark_angle=360/(7*24),
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.5,
    saucer_thickness=8,            thick_saucer_circ=0.0,
    saucer_radius=145,             thin_saucer_circ=0.0,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.0,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.0,
    inner_saucer=true,
    xtxt=0,                        ytxt=0,
    txt_weight=0,                  txt_size=30.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=0.0,
    caption='',                    caption2='',
    txt_font='serif',
    },
    {
    name='minute_of_month',        arg='%d.%H.%M',         max_value=31,
    x=200,                         y=200,
    cup_radius=2,
    cup_wall_thickness=3,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=1.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=1.0,
    handle_length=200,             handle_circ=1.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    graduation_radius=158,
    graduation_thickness=8,        graduation_mark_circ=0.3,
    graduation_mark_angle=360/31,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.5,
    saucer_thickness=8,            thick_saucer_circ=0.0,
    saucer_radius=158,             thin_saucer_circ=1.0,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.3,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
    inner_saucer=true,
    xtxt=0,                        ytxt=0,
    txt_weight=0,                  txt_size=30.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=0.0,
    caption='',                    caption2='',
    txt_font='serif',
    },
    {
    name='minute_of_year',         arg='%j.%H.%M',        max_value=366,
    x=200,                         y=200,
    cup_radius=2,
    cup_wall_thickness=3,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=200,             handle_circ=1.0,
    handle_fg_clr=0xFFFFFF,        handle_fg_alpha=0.0,
    graduation_radius=171,
    graduation_thickness=8,        graduation_mark_circ=0.3,
    graduation_mark_angle=360/366,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.5,
    saucer_thickness=8,            thick_saucer_circ=0.0,
    saucer_radius=171,             thin_saucer_circ=1.0,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.3,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=1.0,
    inner_saucer=true,
    xtxt=40,                       ytxt=20,
    txt_weight=0,                  txt_size=20.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=0.0,
    caption='',                    caption2='',
    txt_font='serif',
    },
--------------- CPU, RAM, SWAP, and HDD usage indicators ---------------------
    {
    name='cpu',                    arg='cpu0',            max_value=100,
    x=166,                         y=256,
    cup_radius=20,
    cup_wall_thickness=40,
    cup_start_angle=110,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=25,
    graduation_thickness=3,        graduation_mark_circ=2,
    graduation_mark_angle=36,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,            thick_saucer_circ=1.0,
    saucer_radius=23,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,	       saucer_fg_alpha= 0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-20,                      ytxt=-5,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' CPU1 ',               caption2='%',
    txt_font='hooge',
    },
    {
    name='cpu',                    arg='cpu1',            max_value=100,
    x=166,                         y=256,
    cup_radius=20,
    cup_wall_thickness=40,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=25,
    graduation_thickness=3,        graduation_mark_circ=2,
    graduation_mark_angle=36,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,            thick_saucer_circ=1.0,
    saucer_radius=27,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,	       saucer_fg_alpha= 0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-20,                      ytxt=8,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' CPU2 ',               caption2='%',
    txt_font='hooge',
    },
    {
    name='cpu',                    arg='cpu2',            max_value=100,
    x=240,                         y=256,
    cup_radius=20,
    cup_wall_thickness=40,
    cup_start_angle=110,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=25,
    graduation_thickness=3,        graduation_mark_circ=2,
    graduation_mark_angle=36,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,            thick_saucer_circ=1.0,
    saucer_radius=23,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,	       saucer_fg_alpha= 0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-20,                      ytxt=-5,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' CPU3 ',               caption2='%',
    txt_font='hooge',
    },
    {
    name='cpu',                    arg='cpu3',            max_value=100,
    x=240,                         y=256,
    cup_radius=20,
    cup_wall_thickness=40,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=25,
    graduation_thickness=3,        graduation_mark_circ=2,
    graduation_mark_angle=36,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,            thick_saucer_circ=1.0,
    saucer_radius=27,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,	       saucer_fg_alpha= 0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-20,                      ytxt=8,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' CPU4 ',               caption2='%',
    txt_font='hooge',
    },
    {
    name='memperc',                arg='/',               max_value=100,
    x=200,                         y=140,
    cup_radius=12,
    cup_wall_thickness=23,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=25,
    graduation_thickness=4,        graduation_mark_circ=4,
    graduation_mark_angle=30,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,            thick_saucer_circ=1.0,
    saucer_radius=28,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha= 0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-20,                      ytxt=-5,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' RAM ',               caption2='%',
    txt_font='hooge',
    },
    {
    name='swapperc',                arg='/',               max_value=100,
    x=294,                         y=174,
    cup_radius=12,
    cup_wall_thickness=23,
    cup_start_angle=30,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=25,
    graduation_thickness=4,        graduation_mark_circ=4,
    graduation_mark_angle=30,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=6,            thick_saucer_circ=1.0,
    saucer_radius=19,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha= 0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-23,                      ytxt=2,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' SWAP ',               caption2='%',
    txt_font='hooge',
    },
    {
    name='fs_used_perc',           arg='/',               max_value=100,
    x=200,                         y=140,
    cup_radius=12,
    cup_wall_thickness=23,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=40,
    graduation_thickness=3,        graduation_mark_circ=2,
    graduation_mark_angle=36,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,            thick_saucer_circ=1.0,
    saucer_radius=36,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha= 0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-20,                      ytxt=10,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' HDD ',               caption2='%',
    txt_font='hooge',
    },   
--------------- Upload and download speed indicators -------------------
    {
    name='upspeedf',               arg='wlp4s0',           max_value=120,
    x=152,                         y=195,
    cup_radius=12,
    cup_wall_thickness=27,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=25,
    graduation_thickness=3,        graduation_mark_circ=2,
    graduation_mark_angle=36,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,            thick_saucer_circ=1.0,
    saucer_radius=22,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-20,                      ytxt=10,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' UP ',                caption2='K',
    txt_font='hooge',
    },
    {
    name='downspeedf',             arg='wlp4s0',           max_value=700,
    x=152,                         y=195,
    cup_radius=12,
    cup_wall_thickness=27,
    cup_start_angle=0,
    cup_bg_clr=0xFFFFFF,           cup_bg_alpha=0.0,
    cup_fg_clr=0xFFFFFF,           cup_fg_alpha=0.0,
    handle_length=40,              handle_fg_alpha=0.0,
    handle_fg_clr=0xFFFFFF,        handle_circ=1.0,
    graduation_radius=25,
    graduation_thickness=4,        graduation_mark_circ=4,
    graduation_mark_angle=36,
    graduation_fg_clr=0xFFFFFF,    graduation_fg_alpha=0.0,
    saucer_thickness=3,            thick_saucer_circ=1.0,
    saucer_radius=28,              thin_saucer_circ=0.95,
    saucer_fg_clr=0xFFFFFF,        saucer_fg_alpha=0.5,
    saucer_mark_fg_clr=0xFFFFFF,   saucer_mark_fg_alpha=0.5,
    inner_saucer=true,
    xtxt=-20,                      ytxt=-5,
    txt_weight=0,                  txt_size=8.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption=' DN ',                caption2='K',
    txt_font='hooge',
    },
----------------- 24-hour minute clockface labels ----------------------
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=191,                         y=85,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='72',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=188,                         y=95,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='144',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=250,                         y=102,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='6',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=240,                         y=111,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='78',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=288,                         y=146,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='12',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=270,                         y=154,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='84',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=304,                         y=204,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='18',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=286,                         y=204,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='90',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=272,                         y=254,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='96',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=288,                         y=262,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='24',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=248,                         y=304,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='30',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=238,                         y=294,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='102',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=190,                         y=322,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='36',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=187,                         y=312,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='108',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=130,                         y=304,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='42',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=135,                         y=294,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='114',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=105,                         y=254,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='120',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=92,                          y=262,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='48',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=77,                          y=204,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='54',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=96,                          y=204,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='126',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=93,                          y=146,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='60',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=104,                         y=154,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='132',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=130,                         y=102,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='66',
    txt_font='serif',
    },
    {
    name='minute_labels',          arg='/',               max_value=0,
    x=135,                         y=111,
    txt_weight=0,                  txt_size=10.0,
    txt_fg_clr=0xFFFFFF,           txt_fg_alpha=1.0,
    caption='138',
    txt_font='serif',
    },
}

------------------------------------------------------------------------
----- Fixed code: do not edit unless you know what you are doing -------
------------------------------------------------------------------------

-------------------- Converts color codes ------------------------------
function rgb_to_r_g_b(clr, alpha)
    return ((clr / 0x10000) % 0x100) / 255., ((clr / 0x100) % 0x100) / 255., (clr % 0x100) / 255., alpha
end

--------------- Displays cups and saucers ------------------------------
local function draw_coffee_table(display, data, value) 
    --parsing coffee_table settings and providing default values
    max_value = data['max_value']

    x, y = data['x'], data['y']
    if x==nil then x=conky_window.width/2 end
    if y==nil then y=conky_window.height/2 end
     
    cup_radius = data['cup_radius']
    if cup_radius==nil then cup_radius=conky_window.width/4 end

    cup_wall_thickness = data['cup_wall_thickness']
    if cup_wall_thickness==nil then cup_wall_thickness=20 end

    handle_length, handle_circ = data['handle_length'], data['handle_circ']
    if handle_length==nil then handle_length=20 end
    if handle_circ==nil then handle_circ=1 end

    cup_start_angle = data['cup_start_angle']
    if cup_start_angle == nil then cup_start_angle=0 end

    total_angle = data['total_angle']
    if total_angle == nil then total_angle=360 end

    cup_sector_angle = (math.abs(total_angle))/max_value
    cup_end_angle = total_angle + cup_start_angle

    cup_bg_clr, cup_bg_alpha = data['cup_bg_clr'], data['cup_bg_alpha']
    if cup_bg_clr==nil then cup_bg_clr =0xffffff end
    if cup_bg_alpha==nil then cup_bg_alpha=0 end
    
    cup_fg_clr, cup_fg_alpha = data['cup_fg_clr'], data['cup_fg_alpha']
    if cup_fg_clr==nil then cup_fg_clr =0xffffff end
    if cup_fg_alpha==nil then cup_fg_alpha=0 end

    handle_fg_clr, handle_fg_alpha = data['handle_fg_clr'], data['handle_fg_alpha']  
    if handle_fg_clr==nil then handle_fg_clr = 0xffffff end
    if handle_fg_alpha==nil then handle_fg_alpha=0 end

    saucer_radius = data['saucer_radius']
    if saucer_radius==nil then saucer_radius=conky_window.width/2 end 

    total_saucer_angle=data['total_saucer_angle']
    if total_saucer_angle==nil then total_saucer_angle=360 end 

    saucer_sector_angle=(math.abs(total_saucer_angle))/max_value
    
    saucer_thickness = data['saucer_thickness']
    if saucer_thickness==nil then saucer_thickness=6 end

    saucer_fg_clr = data['saucer_fg_clr']
    if saucer_fg_clr==nil then saucer_fg_clr=0 end

    saucer_fg_alpha = data['saucer_fg_alpha']
    if saucer_fg_alpha==nil then saucer_fg_alpha=0 end

    saucer_mark_fg_alpha = data['saucer_mark_fg_alpha']
    if saucer_mark_fg_alpha==nil then saucer_mark_fg_alpha=0 end

    saucer_mark_fg_clr = data['saucer_mark_fg_clr']
    if saucer_mark_fg_clr==nil then saucer_mark_fg_clr=0xffffff end

    thick_saucer_circ = data['thick_saucer_circ']
    if thick_saucer_circ==nil then thick_saucer_circ=0.9 end

    thin_saucer_circ = data['thin_saucer_circ']
    if thin_saucer_circ==nil then thin_saucer_circ=0.9 end

    inner_saucer = data['inner_saucer']

    graduation_radius = data['graduation_radius']
    if graduation_radius==nil then graduation_radius = conky_window.width/3 end

    graduation_thickness, graduation_mark_circ = data['graduation_thickness'], data['graduation_mark_circ']
    if graduation_thickness ==nil then graduation_thickness = 2 end
    if graduation_mark_circ ==nil then graduation_mark_circ = 1 end

    graduation_mark_angle = data['graduation_mark_angle']
    if graduation_mark_angle == nil then graduation_mark_angle = total_angle/10 end

    graduation_fg_clr, graduation_fg_alpha = data['graduation_fg_clr'], data['graduation_fg_alpha']
    if graduation_fg_clr ==nil then graduation_fg_clr= 0xffffff end
    if graduation_fg_alpha==nil then graduation_fg_alpha =0 end

    txt_weight, txt_size = data['txt_weight'], data['txt_size']
    if txt_weight == nil then txt_weight=1 end
    if txt_size == nil then txt_size=8 end

    txt_fg_clr, txt_fg_alpha = data['txt_fg_clr'], data['txt_fg_alpha']
    if txt_fg_clr ==nil then txt_fg_clr= 0xffffff end
    if txt_fg_alpha==nil then txt_fg_alpha =0 end

    caption = data['caption']
    if caption==nil then caption='' end

    caption2 = data['caption2']
    if caption2==nil then caption2='' end

    --dynamic xtxt and ytxt location of current minutes and seconds text for text alignment
    xtxt, ytxt = data['xtxt'], data['ytxt']    
    if data['name']=='minute_text' and data['arg']=='%H.%M' then
        local time3str, time3value = '', 0
        time3str = string.format('${time %s}', data['arg'])
        time3str = conky_parse(time3str)
        local time3hours = tonumber(time3str:sub(0,2))
        local time3mins = tonumber(time3str:sub(4,5))
        time3value = 60*time3hours + time3mins
        if time3value < 10 then
            xtxt=61
        elseif time3value < 100 then
            xtxt=42
        elseif time3value < 1000 then
            xtxt=23
        else
            xtxt=4
        end
    elseif data['name']=='time' and data['arg']=='%S' then
        if value < 10 then
            xtxt=66
        else
            xtxt=54
        end
    elseif xtxt==nil then 
        xtxt=0
    end
    if data['name']=='minute_text' and data['arg']=='%H.%M' then
        ytxt=10
    elseif data['name']=='time' and data['arg']=='%S' then
        ytxt=30
    elseif ytxt==nil then
        ytxt=0
    end
    
    --txt_font default value
    txt_font = data['txt_font']
    if txt_font==nil then txt_font='serif' end

    --convert degree to rad and rotate (0 degree is top/north)
    function angle_to_position(start_angle, current_angle)
        if total_angle < 0 then 
            local pos = start_angle - current_angle
            return ( ( pos * (math.pi / 180) ) - (math.pi / 2) )
        else 
            local pos = current_angle + start_angle 
            return ( ( pos * (math.pi / 180) ) - (math.pi / 2) )
        end   
    end
    
    --cup centre background
    if cup_bg_alpha >0 then
        if total_angle < 0 then
            cairo_arc_negative(display, x, y, cup_radius, angle_to_position(cup_start_angle, 0), angle_to_position(cup_end_angle, 0))
        else
            cairo_arc(display, x, y, cup_radius, angle_to_position(cup_start_angle, 0), angle_to_position(cup_start_angle, cup_end_angle))
        end
        cairo_set_source_rgba(display, rgb_to_r_g_b(cup_bg_clr, cup_bg_alpha))
        cairo_set_line_width(display, cup_wall_thickness)
        cairo_stroke(display)
    end 
    
    --cup wall fg
    if cup_fg_alpha > 0 then
        local fg_stop_arc = (cup_sector_angle * value)
        if total_angle < 0 then
            cairo_arc_negative(display, x, y, cup_radius, angle_to_position(cup_start_angle, 0), angle_to_position(cup_start_angle, fg_stop_arc))
        else
            cairo_arc(display, x, y, cup_radius, angle_to_position(cup_start_angle, 0), angle_to_position(cup_start_angle, fg_stop_arc))
        end
        cairo_set_source_rgba(display, rgb_to_r_g_b(cup_fg_clr, cup_fg_alpha))
        cairo_set_line_width(display, cup_wall_thickness)
        cairo_stroke(display)
    end
    
    --cup handle
    if handle_fg_alpha>0 then 
        local start_handle = (cup_sector_angle * value) - (handle_circ*0.5)
        local stop_handle = (cup_sector_angle * value) + (handle_circ*0.5)
        if total_angle < 0 then
            cairo_arc_negative(display, x, y, cup_radius, angle_to_position(cup_start_angle, start_handle), angle_to_position(cup_start_angle, stop_handle))
        else
            cairo_arc(display, x, y, cup_radius, angle_to_position(cup_start_angle, start_handle), angle_to_position(cup_start_angle, stop_handle))
        end
        cairo_set_line_width(display, handle_length)    
        cairo_set_source_rgba(display, rgb_to_r_g_b(handle_fg_clr, handle_fg_alpha))
        cairo_stroke(display)
    end
    
    --saucers
    if saucer_fg_alpha > 0 and (thin_saucer_circ >0 or thick_saucer_circ > 0) then
    
        --thick saucer
        if value < (max_value/2) then 
            j = value + ((max_value*total_saucer_angle)/720)
        else
            j = value - ((max_value*total_saucer_angle)/720)
        end
        local start_saucer = (saucer_sector_angle * j) - (value*saucer_sector_angle*0.5*thick_saucer_circ)
        local stop_saucer = (saucer_sector_angle * j) + (value*saucer_sector_angle*0.5*thick_saucer_circ)
        if total_angle < 0 then
            cairo_arc_negative(display, x, y, saucer_radius, angle_to_position(cup_start_angle, start_saucer), angle_to_position(cup_start_angle, stop_saucer))
        else
            cairo_arc(display, x, y, saucer_radius, angle_to_position(cup_start_angle, start_saucer), angle_to_position(cup_start_angle, stop_saucer))
        end
        cairo_set_source_rgba(display, rgb_to_r_g_b(saucer_fg_clr, saucer_fg_alpha))
        cairo_set_line_width(display, saucer_thickness)
        cairo_stroke(display)
        
        --thin saucer
        if inner_saucer == true then 
            rt = (saucer_radius - 0.5) + (0.5 * saucer_thickness)
        else
            rt = (saucer_radius + 0.5) - (0.5 * saucer_thickness)
        end
        local start_thin_saucer = (saucer_sector_angle * j) - (max_value *0.5*saucer_sector_angle*thin_saucer_circ)
        local stop_thin_saucer = (saucer_sector_angle * j) + (max_value *0.5*saucer_sector_angle*thin_saucer_circ)
        if total_angle < 0 then
            cairo_arc_negative(display, x, y, rt, angle_to_position(cup_start_angle, start_thin_saucer), angle_to_position(cup_start_angle, stop_thin_saucer))
        else
            cairo_arc(display, x, y, rt, angle_to_position(cup_start_angle, start_thin_saucer), angle_to_position(cup_start_angle, stop_thin_saucer))
        end
        cairo_set_source_rgba(display, rgb_to_r_g_b(saucer_fg_clr, saucer_fg_alpha))
        cairo_set_line_width(display, 1)
        cairo_stroke(display)
    end
    
   --saucer mark
    if saucer_mark_fg_alpha > 0 then 
        local start_cm = (saucer_sector_angle * value) - (handle_circ *0.5 )
        local stop_cm = (saucer_sector_angle * value) + (handle_circ *0.5 )
        if total_angle < 0 then
            cairo_arc_negative(display, x, y, saucer_radius, angle_to_position(cup_start_angle, start_cm), angle_to_position(cup_start_angle, stop_cm))
        else
            cairo_arc(display, x, y, saucer_radius, angle_to_position(cup_start_angle, start_cm), angle_to_position(cup_start_angle, stop_cm))
        end
        cairo_set_source_rgba(display, rgb_to_r_g_b(saucer_mark_fg_clr, saucer_mark_fg_alpha))
        cairo_set_line_width(display, saucer_thickness)
        cairo_stroke(display)
    end 
    
   --graduation mark 
    if graduation_radius > 0 and graduation_thickness > 0 and graduation_mark_angle > 0 then
        number_graduation = (math.abs(total_angle) +1)/ graduation_mark_angle
        local start_arc_grad = 0
        local stop_arc_grad = 0
        local i = 0
        while i < number_graduation do
            local start_arc_grad = (graduation_mark_angle * (i)) - (graduation_mark_circ *0.5)
            local stop_arc_grad = (graduation_mark_angle * (i)) + (graduation_mark_circ *0.5)
            if total_angle < 0 then
                cairo_arc_negative(display, x, y, graduation_radius, angle_to_position(cup_start_angle, start_arc_grad), angle_to_position(cup_start_angle, stop_arc_grad))
            else
                cairo_arc(display, x, y, graduation_radius, angle_to_position(cup_start_angle, start_arc_grad), angle_to_position(cup_start_angle, stop_arc_grad))
            end
            cairo_set_source_rgba(display,rgb_to_r_g_b(graduation_fg_clr,graduation_fg_alpha))
            cairo_set_line_width(display, graduation_thickness)
            cairo_stroke(display)
            i = i + 1
        end
    end   
    
    --text fonts
    if txt_fg_alpha>0 and txt_font=='serif' then 
        cairo_select_font_face (display, "serif", CAIRO_FONT_SLANT_NORMAL, txt_weight);
        cairo_set_font_size (display,txt_size)
        cairo_set_source_rgba (display, rgb_to_r_g_b(txt_fg_clr, txt_fg_alpha))
        cairo_move_to (display,x+xtxt,y+ytxt)
        cairo_show_text (display, caption) cairo_show_text (display,value) cairo_show_text (display, caption2)
        cairo_stroke (display)
    end
    if txt_fg_alpha>0 and txt_font=='hooge' then 
        cairo_select_font_face (display, "hooge 05_53", CAIRO_FONT_SLANT_NORMAL, txt_weight);
        cairo_set_font_size (display,txt_size)
        cairo_set_source_rgba (display, rgb_to_r_g_b(txt_fg_clr, txt_fg_alpha))
        cairo_move_to (display,x+xtxt,y+ytxt)
        cairo_show_text (display, caption) cairo_show_text (display,value) cairo_show_text (display, caption2)
        cairo_stroke (display)
    end
end

---------- Loads coffee_table setings and draws coffee table -----------
function display_coffee_table(display)
    local function load_coffee_table(display, data)
        local str, value = '', 0       
        if data['name'] == 'hour_hand' then
            local max_value = data['max_value']
            str = string.format('${time %s}', data['arg'])
            str = conky_parse(str)
            local value2 = tonumber(str:sub(0,2))
            if value2 == max_value then 
                value2 = 0 
            end
            value = value2 + (tonumber(str:sub(4,5))/60)
        elseif data['name'] == 'minute_text' then
            str = string.format('${time %s}', data['arg'])
            str = conky_parse(str)
            local valuehours = tonumber(str:sub(0,2))
            local valuemins = tonumber(str:sub(4,5))
            value = 60*valuehours + valuemins
        elseif data['name'] == 'minute_of_week' then
            str = string.format('${time %s}', data['arg'])
            str = conky_parse(str)
            local valuedays = tonumber(str:sub(0,1))
            local valuehours = tonumber(str:sub(3,4))
            local valuemins = tonumber(str:sub(6,7))
            value = valuedays + valuehours/24 + valuemins/1440
        elseif data['name'] == 'minute_of_month' then
            str = string.format('${time %s}', data['arg'])
            str = conky_parse(str)
            local valuedays = tonumber(str:sub(0,2))
            local valuehours = tonumber(str:sub(4,6))
            local valuemins = tonumber(str:sub(7,8))
            value = valuedays + valuehours/24 + valuemins/1440
        elseif data['name'] == 'minute_of_year' then
            str = string.format('${time %s}', data['arg'])
            str = conky_parse(str)
            local valuedays = tonumber(str:sub(0,3))
            local valuehours = tonumber(str:sub(5,7))
            local valuemins = tonumber(str:sub(8,9))
            value = valuedays + valuehours/24 + valuemins/1440
        else
            str = string.format('${%s %s}',data['name'], data['arg'])
            str = conky_parse(str)
            value = tonumber(str)
        end
        if value == nil then 
            value = 0 
        end
        draw_coffee_table(display, data, value)
    end
    for i in pairs(coffee_table) do
        load_coffee_table(display, coffee_table[i])
    end    
end

runscheck = 0 -- fix for draw shades running script twice on every update

-------------------------- conky_main() --------------------------------
function conky_main()
    if conky_window == nil then 
        return
    end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    local updates = conky_parse('${updates}')
    update_num = tonumber(updates)
    if update_num > 5 then
      cairo_set_antialias (display, CAIRO_ANTIALIAS_SUBPIXEL)
      display_coffee_table(display)
      cairo_set_antialias (display, CAIRO_ANTIALIAS_DEFAULT)
    end
    cairo_surface_destroy(cs)
    cairo_destroy(display)
end
