/**
 * Created by mosaddek on 3/4/15.
 */

function format(d) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
        '<tr>' +
        '<td>Full name:</td>' +
        '<td>' + d.name + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Extension number:</td>' +
        '<td>' + d.extn + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Extra info:</td>' +
        '<td>And any further details here (images etc)...</td>' +
        '</tr>' +
        '</table>';
}


// Data Table

$('.convert-data-table').dataTable({
	sPaginationType:"full_numbers",
	"language": {
	    　　"sProcessing": "处理中...",
	      "sLengthMenu": "显示 _MENU_ 项结果",
	      "sZeroRecords": "没有匹配结果",
	      "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
	      "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
	      "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
	      "sInfoPostFix": "",
	      "sSearch": "搜索:",
	      "sUrl": "",
	      "sEmptyTable": "表中数据为空",
	      "sLoadingRecords": "载入中...",
	      "sInfoThousands": ",",
	      "oPaginate": {
	       "sFirst": "首页",
	       "sPrevious": "上页",
	       "sNext": "下页",
	       "sLast": "末页"
	      },
	      "oAria": {
	        "sSortAscending": ": 以升序排列此列",
	        "sSortDescending": ": 以降序排列此列"
	      }
		},
		"aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0 ] }],
		"aaSorting": [[1, "asc"]],
    dom: '<"tbl-head clearfix"T>,<"tbl-top clearfix"lfr>,t,<"tbl-footer clearfix"<"tbl-info pull-left"i><"tbl-pagin pull-right"p>>',
    tableTools: {
        "sSwfPath": "swf/copy_csv_xls_pdf.swf"
    }
});




$('.colvis-data-table').DataTable({
    "PaginationType": "bootstrap",
    dom: '<"tbl-head clearfix"C>,<"tbl-top clearfix"lfr>,t,<"tbl-footer clearfix"<"tbl-info pull-left"i><"tbl-pagin pull-right"p>>'


});


$('.responsive-data-table').DataTable({
    "PaginationType": "bootstrap",
    responsive: true,
    dom: '<"tbl-top clearfix"lfr>,t,<"tbl-footer clearfix"<"tbl-info pull-left"i><"tbl-pagin pull-right"p>>'
});

//
//
//$('.scrolling-table').DataTable({
//    "PaginationType": "bootstrap",
//    "ajax": "data/2500.txt",
//    "scrollY": "200px",
//    dom: '<"tbl-top clearfix"fr>,t,<"tbl-footer clearfix"<"tbl-info-large pull-left"i><"tbl-pagin pull-right"S>>',
//
//    "deferRender": true
//
//
//});


$(function() {
    var table = $('.row-details-data-table').DataTable({
        "ajax": "data/objects.txt",
        dom: '<"tbl-top clearfix"lfr>,t,<"tbl-footer clearfix"<"tbl-info pull-left"i><"tbl-pagin pull-right"p>>',
        "columns": [{
            "class": 'details-control',
            "orderable": false,
            "data": null,
            "defaultContent": ''
        }, {
            "data": "name"
        }, {
            "data": "position"
        }, {
            "data": "office"
        }, {
            "data": "salary"
        }],
        "order": [
            [1, 'asc']
        ]
    });

    // Add event listener for opening and closing details
    $('.row-details-data-table tbody').on('click', 'td.details-control', function() {
        var tr = $(this).closest('tr');
        var row = table.row(tr);

        if (row.child.isShown()) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        } else {
            // Open this row
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
    });
});