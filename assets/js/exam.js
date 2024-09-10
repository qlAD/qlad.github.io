document.addEventListener('DOMContentLoaded', function() {
    const examStartTime = new Date("{{ .Params.examStartTime }}");
    const examDuration = parseInt("{{ .Params.examDurationMinutes }}") * 60 * 1000; // Convert minutes to milliseconds
    const submitButton = document.getElementById('submit-button');
    const timerElement = document.getElementById('exam-timer');
  
    function updateTimer() {
      const now = new Date();
      const timeRemaining = examStartTime.getTime() + examDuration - now.getTime();
      
      if (timeRemaining <= 0) {
        timerElement.textContent = "考试时间已结束";
        submitButton.disabled = true;
        document.getElementById('exam-form').style.display = 'none'; // Hide the form
        return;
      }
      
      const minutes = Math.floor(timeRemaining / (1000 * 60));
      const seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);
      
      timerElement.textContent = `剩余时间: ${minutes}分钟 ${seconds}秒`;
      
      setTimeout(updateTimer, 1000); // Update every second
    }
    
    // Start the timer if the exam start time is set
    if (examStartTime) {
      updateTimer();
    }
  });
  