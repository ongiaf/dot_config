;;; ui/modus-themes/config.el -*- lexical-binding: t; -*-

(defun ayano/apply-theme (apperance)
  (mapc #'disable-theme custom-enabled-themes)
  (pcase apperance
    ('light (load-theme 'modus-operandi-deuteranopia t))
    ('dark  (load-theme 'modus-vivendi-deuteranopia  t))))

(defun ayano/extract-colors-from-list (colors-list n)
  (mapcar (lambda (colors)
            (list (car colors) (nth n colors)))
          colors-list))

(setq ayano/modus-themes-overrides-dracula-colors
      '((bg-main        "#0B0D0F" "#F5F5F5")
        (bg-dim         "#090A0C" "#C4C4C4")
        (fg-main        "#F8F8F2" "#1F1F1F")
        (red            "#FF9580" "#CB3A2A")
        (red-warmer     "#FFAA99" "#D74C3D")
        (red-cooler     "#CC7766" "#A22E22")
        (green          "#8AFF80" "#14710A")
        (green-warmer   "#6ECC66" "#105A08")
        (green-cooler   "#A2FF99" "#198D0C")
        (yellow         "#FFFF80" "#846E15")
        (yellow-warmer  "#FFFF99" "#9E841A")
        (yellow-cooler  "#CCCC66" "#6A5811")
        (blue           "#9580FF" "#644AC9")
        (blue-warmer    "#AA99FF" "#7862D0")
        (blue-cooler    "#7766CC" "#6A5811")
        (magenta        "#FF80BF" "#A3144D")
        (magenta-warmer "#CC6699" "#82103E")
        (magenta-cooler "#FF99CC" "#BF185A")
        (cyan           "#80FFEA" "#036A96")
        (cyan-warmer    "#66CCBB" "#025578")
        (cyan-cooler    "#99FFEE" "#047FB4")))

(use-package! modus-themes
  :init
  (setq doom-theme 'modus-vivendi-deuteranopia)
  (if (and IS-MAC (display-graphic-p))
      (add-hook 'ns-system-appearance-change-functions #'ayano/apply-theme))
  :config
  (setq modus-themes-bold-constructs t
        modus-themes-italic-constructs t
        modus-vivendi-deuteranopia-palette-overrides  (ayano/extract-colors-from-list ayano/modus-themes-overrides-dracula-colors 1)
        modus-operandi-deuteranopia-palette-overrides (ayano/extract-colors-from-list ayano/modus-themes-overrides-dracula-colors 2)))

;; enable spacious-padding
(use-package! spacious-padding
  :init
  (spacious-padding-mode 1))

(use-package! nova
  :init
  (nova-vertico-mode 1)
  ;; (nova-eldoc-mode 1)
  )
