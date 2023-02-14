let progressList = [];
let issueList = [];
$(function to_ajax() {
    $.ajax({
        type: 'GET',
        url: "<%=request.getContextPath() %>/board/api1",
        contentType: false,
        processData: false,
        success: function (data) {
            console.log(data);
            if (data !== undefined) {
                console.log("hi")
                progressList = data.progressList;
                issueList = data.issueList;
                make_view();
            }
        }
    })
})
const make_view = () => {
    const element = document.getElementsByClassName('color-tt-wrap')[0];
    $(element).empty();
    if (progressList !== undefined) {
        progressList.sort((a, b) => a.rank - b.rank);
        progressList.forEach((delta) => {
            element.innerHTML +=
                '<div class="color-tt" >' +
                '<div class="flex-box">'+
                `<div style="text-align: center">\${delta.name}</div>` +
                // '<div>' + JSON.stringify(delta) + '</div>' +
                '<div>' + delta.progress + '</div>' +
                '<button onclick="make_issue_button(this.parentElement.nextSibling)">' + '이슈 만들기' + '</button>'+
                '</div>'+
                '<div class="color-tt-in" id = "progressName::'+delta.name+'" data-index="' + delta.progress +
                '" ondragover="dragOver(event)" ondrop="drop(event)" data-rank="' + delta.rank +'" ></div>' +
                // '<div>' + delta.no + '<br/></div>' +
                '</div>'
        })
    }
    if (issueList !== undefined) {
        console.log(issueList);
        issueList.forEach((delta) => {
            const element = document.getElementsByClassName('color-tt-wrap')[0].children;
            for (let i = 0; i < element.length; i++) {
                if (parseInt(element[i].children[1].dataset.index) === delta.progress) {
                    console.log(delta.progress);
                    console.log("일치")
                    const ele = document.getElementsByClassName('color-tt-in')[element[i].children[1].dataset.rank - 1];
                    ele.innerHTML +=
                        '<div class="progress-stat">'+
                        '<div id="'+"issueRank::"+delta.no+'" class="boxt" data-no="'+delta.no+'" data-index="'+(i+1)+'" ondrop="drop_issue(event)" draggable="true" ondragstart="dragStart(event)">' +
                        '<div>' + delta.name + '</div>' +
                        '<div>' + delta.progress + '</div>' +
                        // '<div>' + delta.no + '<br/></div>' +
                        '</div>'+
                        '</div>'
                }
            }
        })
    }
}
const check_console = () => {
    console.log(progressList);
    console.log("실행")
    progressList[0].name = "그래";
    make_view();
}
const dragStart = (e) => {
    console.log(e.target.id);
    e.dataTransfer.setDragImage(e.target, 0, 0);
    e.dataTransfer.setData('targetId',e.target.id);
}
const dragOver = (e) => {
    e.preventDefault();
}
const drop = (e) => {
    const targetId = e.dataTransfer.getData('targetId');
    e.preventDefault();
    const selectIssue = document.getElementById(targetId);
    const selectProgress = e.target.dataset.index;
    if(selectProgress !== undefined) {
        issueList[parseInt(selectIssue.dataset.no) - 1].progress = parseInt(selectProgress);
        console.log(issueList);
    }
    // document.getElementById(targetId).dataset.index = e.target.dataset.index;
    // e.target.appendChild(document.getElementById(targetId));
    make_view();
}
const drop_issue = (e) => {
    console.log(e);
    make_view();
}
const check_issue_button = () => {
    const alreadyMake = document.getElementById("make_issue");
    if(alreadyMake !== null){
        console.log(alreadyMake.parentElement);
        $(alreadyMake.parentElement).remove();
    }
}
const make_issue_button = e => {
    check_issue_button();
    e.innerHTML +=
        '<div class="boxt">'+
        '<input type="text" id="make_issue"/>'+
        '</div>'
    const issue = document.getElementById("make_issue");
    issue.addEventListener("keyup", function (event){
        if (event.keyCode === 13) {
            make_issue(issue.value, e.dataset.index);
        }
    });
    document.addEventListener("keydown", function(event){
        if (event.keyCode === 27 || event.which === 27) {
            check_issue_button();
        }
    });
}
const make_issue = (e, f) => {
    console.log("asdf");
    console.log(f);
    const pushParam = {value: 2, name: e, progress: parseInt(f)}
    console.log(pushParam);
    issueList.push(pushParam);
    make_view();
}