define(['jquery', 'bootstrap', 'backend', 'table', 'form', 'backend/xshop/libs/Hook'], function ($, undefined, Backend, Table, Form, Hook) {

    var Controller = {
        index: function() {
            Hook.init(function() {
                Controller.bootIndex()
            })
        },
        bootIndex: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'xshop/category/index' + location.search,
                    add_url: 'xshop/category/add',
                    edit_url: 'xshop/category/edit',
                    del_url: 'xshop/category/del',
                    multi_url: 'xshop/category/multi',
                    table: 'xshop_category',
                }
            });

            var table = $("#table");
            var config = {
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'sort',
                escape: false,
                pagination: false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'name', title: __('Name'), align: 'left'},
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {field: 'sort', title: __('Sort')},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            }

            config = Hook.listen('table_config', config)
            // 初始化表格
            table.bootstrapTable(config);

            // 为表格绑定事件
            Table.api.bindevent(table);
            table.on('post-body.bs.table', function(e, setting, json, xhr) {
                var payload = {
                    e: this,
                    table: table
                }
                Hook.listen('table_event', payload)
            })
            Hook.listen('document', table)
        },
        select: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'xshop/category/index' + location.search,
                    add_url: 'xshop/category/add',
                    edit_url: 'xshop/category/edit',
                    del_url: 'xshop/category/del',
                    multi_url: 'xshop/category/multi',
                    table: 'xshop_category',
                }
            });

            var table = $("#table");
            var config = {
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'sort',
                escape: false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'name', title: __('Name'), align: 'left'},
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {field: 'sort', title: __('Sort'), visible: false},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime, visible: false},
                        {
                            field: 'operate', title: __('Operate'), events: {
                                'click .btn-chooseone': function (e, value, row, index) {
                                    var multiple = Backend.api.query('multiple');
                                    multiple = multiple == 'true' ? true : false;
                                    Fast.api.close({row: row, multiple: multiple});
                                },
                            }, formatter: function () {
                                return '<a href="javascript:;" class="btn btn-danger btn-chooseone btn-xs"><i class="fa fa-check"></i> ' + __('Choose') + '</a>';
                            }
                        }
                    ]
                ]
            }
            config = Hook.listen('table_config', config)
            // 初始化表格
            table.bootstrapTable(config);
            var ids = Fast.api.query('ids')
            $(table).on('post-body.bs.table', function() {
                if (typeof ids == 'string') {
                    ids = ids.split(',')
                    $.each(ids, function(i, v) {
                        ids[i] = parseInt(v)
                    })
                }
                table.bootstrapTable('checkBy', {
                    field: 'id', values: ids
                })
                var payload = {
                    e: this,
                    table: table
                }
                Hook.listen('table_event', payload)
            })
            Hook.listen('document')
            // 选中多个
            $(document).on("click", ".btn-choose-multi", function () {
                var dataArr = new Array();
                $.each(table.bootstrapTable("getAllSelections"), function (i, j) {
                    dataArr.push(j.id);
                });
                var multiple = Backend.api.query('multiple');
                multiple = multiple == 'true' ? true : false;
                Fast.api.close({data: dataArr, multiple: multiple});
            });
            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
            Hook.listen('form')
        },
        edit: function () {
            Controller.api.bindevent();
            Hook.listen('form')
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});