<div class="modal fade" id="ReportForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="post" name="Report_action" id="ReportForm_action">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Report</h4>
                </div>                
                <div class="modal-body">
                    <h4><b>Choose a reason</b></h4>
                    <div class="radio" >
                        <label><input type="radio" value="a" name="optradio">Violent content</label>
                    </div>
                    <div class="radio">
                        <label><input type="radio" value="b" name="optradio">Nudity content</label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" value="c" name="optradio">
                            <input type="text" class="form-control" style="width: 250px;" placeholder="Other? Type your reason here..." name="otherreason">
                        </label>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="reason_report" name="reason_report">
                    <button type="submit" class="btn btn-primary btn-md" id="ReportButton" data-dismiss="modal">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>