// Oculta el panel de éxito automáticamente luego de 4 segundos.
window.onload = function () {
    var panel = document.getElementById("MainContent_panelExito");
    if (panel) {
        setTimeout(function () {
            // Comienza a desvanecer.
            panel.style.transition = "opacity 1s ease";
            panel.style.opacity = 0;

            // Luego de la animación, lo oculta del todo.
            setTimeout(function () {
                panel.style.display = "none";
            }, 1000); // duración del fade.
        }, 4000); // esperar 4 segundos antes de empezar a desvanecer.
    }
};