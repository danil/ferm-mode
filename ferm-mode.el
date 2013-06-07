;;; ferm-mode.el --- Major mode for editing ferm config files.

;; Copyright (C) 2013  Dmitry Bogatov

;; Author: Dmitry Bogatov <KAction@gnu.org>
;; Keywords: convenience, tools, unix

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:
(eval-when-compile (require 'cl))
(defconst ferm-mode-version "1.0"
  "Ferm mode version.")
(defvar ferm-mode-hook nil
  "Hook called when entering `ferm-mode'.")

(defmacro /ferm-define-face-variable (name attr docstring)
  `(progn
     (defvar ,name (quote ,name) ,docstring)
     (defface ,name '((t ,attr)) ,docstring)))

(/ferm-define-face-variable ferm-location-keyword-face
    (:inherit font-lock-keyword-face)
    "Face to use for location keywords.")
(/ferm-define-face-variable ferm-terminal-target-face
    (:inherit font-lock-preprocessor-face)
    "Face to use for terminal targets.")
(/ferm-define-face-variable ferm-predefined-chain-face
    (:inherit font-lock-preprocessor-face)
    "Face to use for builtin chains.")
(/ferm-define-face-variable ferm-basic-match-keyword-face
    (:inherit font-lock-builtin-face)
    "Face to use for basic match keywords.")
(/ferm-define-face-variable ferm-basic-target-keyword-face
    (:inherit font-lock-variable-name-face)
    "Face to use for basic target keywords.")
(/ferm-define-face-variable ferm-module-name-face
    (:inherit font-lock-function-name-face)
    "Face to use for loadable modules names.")
(/ferm-define-face-variable ferm-module-match-keyword-face
    (:inherit font-lock-type-face)
    "Face to use for match keywords exported by modules.")
(/ferm-define-face-variable ferm-automatic-variable-face
    (:inherit font-lock-doc-face)
    "Face to use for ferm automatic variables")
(/ferm-define-face-variable ferm-function-declaration-face
    (:inherit font-lock-function-name-face)
    "Face to use for function declaration.")
(/ferm-define-face-variable ferm-function-call-face
    (:inherit font-lock-warning-face)
    "Face to use for function calls.")
(/ferm-define-face-variable ferm-lang-keyword-face
    (:inherit font-lock-keyword-face)
    "Face to use for ferm syntax elements.")
(/ferm-define-face-variable ferm-builtin-function-face
    (:inherit font-lock-builtin-face)
    "Face to use for ferm builtin functions.")

(defvar ferm-location-keyword-face 'ferm-location-keyword-face
  "Face name to use for location keywords.")
(defface ferm-location-keyword-face

(defconst ferm-mode-keyword-list
  '("table" "chain" "policy" "mod"))
(defconst ferm-mode-constant-list
  '("ACCEPT" "DROP" "REJECT"))
(defconst ferm-mode-preproces-list
  '("INPUT" "OUTPUT" "FORWARD"))
(defconst ferm-mode-builtin-list
  '("filter"))
(defconst ferm-mode-font-lock-list nil)
(defconst ferm-mode-auto-mode-list nil)
(defconst ferm-mode-function-list nil)


(define-derived-mode ferm-mode shell-script-mode "ferm"
  (font-lock-add-keywords
   nil (list
	(cons
	 (rx "mod" (+ blank) (group-n 2 (+ word)))
	 '(2 font-lock-variable-name-face))
	  ;;(2 font-lock-variable-name-face)
	  )))
	;; (cons (regexp-opt ferm-mode-builtin-list 'words)
	;;       'font-lock-builtin-face)
	;; (cons (regexp-opt ferm-mode-keyword-list 'words)
	;;       'font-lock-keyword-face)
	;; (cons (regexp-opt ferm-mode-preproces-list 'words)
	;;       'font-lock-preprocessor-face)
	;; (cons (regexp-opt ferm-mode-constant-list 'words)
	;;       'font-lock-constant-face))))




(provide 'ferm-mode)
;;; ferm-mode.el ends here
