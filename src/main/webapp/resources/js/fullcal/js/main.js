var draggedEventIsAllDay;
var activeInactiveWeekends = true;

function getDisplayEventDate(event) {

	var displayEventDate;

	if (event.allDay == false) {
		var startTimeEventInfo = moment(event.start).format('HH:mm');
		var endTimeEventInfo = moment(event.end).format('HH:mm');
		displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
	} else {
		displayEventDate = "하루종일";
	}

	return displayEventDate;
}

function filtering(event) {
	var show_username = true;
	var show_type = true;


	return show_username && show_type;
}

function calDateWhenResize(event) {

	var newDates = {
			startDate: '',
			endDate: ''
	};

	if (event.allDay) {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
		newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
	} else {
		newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
		newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
	}

	return newDates;
}



// 달력호출
var calendar = $('#calendar').fullCalendar({
	//일정 렌더링
	eventRender: function (event, element, view) {
		var date1 = new Date();
		var date2 = new Date();
		var aa =function(date){
			var date3 = new Date(date);
		    var year = date3.getFullYear();              //yyyy
		    var month = (1 + date3.getMonth());          //M
		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		    var day = date3.getDate();                   //d
		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		    return  year + '-' + month + '-' + day;
		}
		
		date1 = aa(event.start);
		date2 = aa(event.end);
		
		//일정에 hover시 요약
		element.popover({
			title: $('<div />', {
				class: 'popoverTitleCalendar',
				text: '예약번호 : '+event._id
			}).css({
				'background': event.backgroundColor,
				'color': event.textColor
			}),
			content: $('<div />', {
				class: 'popoverInfoCalendar'
			}).append('<p><strong>출발지:</strong> ' + event.title + '</p>')
			.append('<p><strong>하차지:</strong> ' + event.username + '</p>')
			.append('<p><strong>상차일:</strong> ' + date1 + '</p>')
			.append('<p><strong>하차일:</strong> ' + date2 + '</p>')
			.append('<div class="popoverDescCalendar"><strong>정산금액:</strong> ' + Math.ceil(event.description*0.7) + '원 </div>'),
			delay: {
				show: "800",
				hide: "50"
			},
			trigger: 'hover',
			placement: 'top',
			html: true,
			container: 'body'
		});

		return filtering(event);

	},

	
	//상단에 담은 메뉴
	header: {
		left: 'today, prevYear, nextYear, viewWeekends',
		center: 'prev, title, next',
		right: 'month,agendaWeek,agendaDay,listWeek'
	},
	
	// 메뉴별 날짜 표현방식 설정
	views: {

		month: {
			columnFormat: 'dddd'
		},
		agendaWeek: {
			columnFormat: 'M/D ddd',
			titleFormat: 'YYYY년 M월 D일',
			eventLimit: false
		},
		agendaDay: {
			columnFormat: 'dddd',
			eventLimit: false
		},
		listWeek: {
			columnFormat: ''
		}
	},

	/* ****************
	 *  일정 받아옴 
	 * ************** */
	events: function (start, end, timezone, callback) {
		$.ajax({
			type: "get",
			url: "dCal.do",
			data : {mNo : $('#mNo').val()},
			success: function (response) {
				var events = [];
				for (var i = 0; i < response.length; i++) {
					var evt = {
							_id : response[i].rno,
							title: response[i].startAddr,
							start : response[i].startDate,
							end : response[i].endDate,
							description : response[i].amount,
							username : response[i].endAddr
							
					};
					console.log(evt.start);
					events.push(evt);
				}
				callback(events);
				var fixedDate = response.map(function (array) {
					if (array.allDay && array.start !== array.end) {
						// 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
						array.end = moment(array.end).add(1, 'days');
					}
					return array;
				});
				callback(fixedDate);
			}
		});
	},

	// 일정 호출후 달력표시
	eventAfterAllRender: function (view) {
		if (view.name == "month") {
			$(".fc-content").css('height', 'auto');
		}
	},


	locale: 'ko', //한국어설정
	timezone: "local", //현재지역기준
	nextDayThreshold: "09:00:00", //기본시간값
	allDaySlot: true, //일정 추가 혹은 수정시 하루종일 선택가능
	displayEventTime: true, //일정 시작시간표시
	displayEventEnd: true,	//일정 종료시간 표시
	firstDay: 0, //월요일이 먼저 오게 하려면 1
	weekNumbers: false, //요일 숫자로 표시
	selectable: true, //선택가능
	weekNumberCalculation: "UTF-8",
	eventLimit: true, 
	views: {
		month: {
			eventLimit: 12
		}
	},
	eventLimitClick: 'week', //popover
	navLinks: true,
	defaultDate: moment('2020-05'), // 달력 기본 날짜
	timeFormat: 'HH:mm',
	defaultTimedEventDuration: '01:00:00',
	editable: true,
	minTime: '00:00:00',
	maxTime: '24:00:00',
	slotLabelFormat: 'HH:mm',
	weekends: true,
	nowIndicator: true,
	dayPopoverFormat: 'yyyy MM/dd',
	longPressDelay: 0,
	eventLongPressDelay: 0,
	selectLongPressDelay: 0
});