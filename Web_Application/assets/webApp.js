$(document).ready(function () {
	console.log("%c webApp.js Loaded Successfully", "background-color: black; color: orange; font-weight: 500; padding: 2px 5px 2px 0;");

	// Disable Image Drag
	$('img').on('dragstart', function (event) { event.preventDefault(); });

	// Drag & Scroll  Control
	var clicked = false, clickY, clickX;
	var zoomLevelDefault = 1;
	var zoomLevel;

	$(document).on({
		'mousemove': function (e) {
			clicked && updateScroll(e, this);
		},
		'mousedown': function (e) {
			clicked = true;
			clickY = e.pageY;
			clickX = e.pageX;
		},
		'mouseup': function () {
			clicked = false;
			$('html').css('cursor', 'auto');
		},
		'mousewheel': function (e) {
			updateZoom(e);
		}
	});

	var updateScroll = function (e, el) {
		$('html').css('cursor', 'none');
		var $el = $(el);
		$el.scrollTop($el.scrollTop() + (clickY - e.pageY));
		$el.scrollLeft($el.scrollLeft() + (clickX - e.pageX));
	}

	function updateZoom(e) {
		if (e.deltaY < 0) {
			// Zoom in
			if (zoomLevelDefault < 0.5) return;
			zoomLevel = zoomLevelDefault -= .1;
			$('body').css({ 'transform': 'scale(' + zoomLevel + ')', 'transform-origin': 'center' });
			return;
		} else {
			// Zoom Out
			if (zoomLevelDefault > 1.5) return;
			zoomLevel = zoomLevelDefault += .1;
			$('body').css({ 'transform': 'scale(' + zoomLevel + ')', 'transform-origin': 'center' });
			return;
		}
	}


	// Setup Map Canvas \\
	var c = document.getElementById("liveCanvas");
	var ctx = c.getContext("2d");

	// Set Variables
	var mapCenterX = 2652;
	var mapCenterY = 5183;


	// Retrieve JSON Array \\
	/* 
	 * CREATE AN AJAX FUNCTIONS HERE WHEN CALLING FOR AN UPDATED JSON
	 * RETURN ARRAY AS 'unitsJSON'. STRUCTURE OF ARRAY IS SHOWN BELOW
	 * AFTER RETRIEVING NEW JSON CALL THE FUNCTION: addUnit() 
	 */
	unitsJSON = {
		280: {
			'jsonVarX': 473.561,
			'jsonVarY': -987.016,
			'unitType': 'leo'
		},
		469: {
			'jsonVarX': 463.561,
			'jsonVarY': -992.016,
			'unitType': 'leo'
		},
		185: {
			'jsonVarX': 483.561,
			'jsonVarY': -994.016,
			'unitType': 'leo'
		},
		529: {
			'jsonVarX': 377.938,
			'jsonVarY': -592.49,
			'unitType': 'fire'
		},
		451: {
			'jsonVarX': 145.711,
			'jsonVarY': -1043.158,
			'unitType': 'leo'
		}
	};

	addUnit()

	// Add Unit \\
	function addUnit() {
		// Clear Existing Units
		ctx.clearRect(0, 0, 5740, 7750);

		let i = 0;
		Object.keys(unitsJSON).forEach(function (id) {

			// Set Variables
			let jsonVarX = unitsJSON[Object.keys(unitsJSON)[i]].jsonVarX;
			let jsonVarY = unitsJSON[Object.keys(unitsJSON)[i]].jsonVarY;
			if (jsonVarY < mapCenterY) jsonVarY = jsonVarY * -1;

			let unitType = unitsJSON[Object.keys(unitsJSON)[i]].unitType;
			if (unitType == "leo") unitColor = "blue";
			if (unitType == "fire") unitColor = "red";

			let unitId = id;

			let mapBlipX = mapCenterX + (jsonVarX * .66) - 18;
			let mapBlipY = mapCenterY + (jsonVarY * .66) - 12;

			ctx.beginPath();
			
			// Rect
			ctx.fillStyle = unitColor;
			ctx.fillRect(mapBlipX, mapBlipY, 34, 24);
			
			// Stroke
			ctx.strokeStyle = "white";
			ctx.lineWidth = 2;
			ctx.strokeRect(mapBlipX, mapBlipY, 34, 24);
			
			// Text
			ctx.fillStyle = "white";
			ctx.font = "18px Arial";
			ctx.fillText(unitId, mapBlipX + 2, mapBlipY + 18);
			
			return i++;
		});
	}
});