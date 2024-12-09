;;; init-ai.el --- Configuration for AI assistants

;;; Commentary:
;;; Code:

(use-package load-env-vars)
(use-package gptel
  :config
  (load-env-vars "~/.emacs.d/.env")
  (defvar gptel--deepseek-api-key (getenv "DEEPSEEK_API_KEY"))
  ;; don't send chat history
  (setq gptel--num-messages-to-send 0)
  (when gptel--deepseek-api-key
    (setq gptel--deepseek (gptel-make-openai "DeepSeek"
                                             :host "api.deepseek.com"
                                             :endpoint "/chat/completions"
                                             :stream t
                                             :key gptel--deepseek-api-key
                                             :models '(deepseek-chat)))
    (setq gptel-model 'deepseek-chat
          gptel-backend gptel--deepseek))
  (defvar gptel--openrouter-api-key (getenv "OPENROUTER_API_KEY"))
  (when gptel--openrouter-api-key
    (gptel-make-openai "OpenRouter"
      :host "openrouter.ai"
      :endpoint "/api/v1/chat/completions"
      :stream t
      :key gptel--openrouter-api-key
      :models '(anthropic/claude-3.5-sonnet)))

  (defun gptel-send-with-options ()
    "Send query. With prefix ARG open gptel's menu instead."
    (interactive)
    (gptel--suffix-send (transient-args 'gptel-menu)))
)

;; elysium can automatically apply AI-generated changes
(use-package elysium)

;; evedel is too complicated to me. But the thought behind is inspiring.
(unless (package-installed-p 'evedel)
  (package-vc-install
   '(evedel :url "https://github.com/daedsidog/evedel"
            :branch "master")))
(use-package evedel)

(unless (package-installed-p 'aider)
  (package-vc-install
   '(aider :url "https://github.com/tninja/aider.el"
           :branch "main")))
(use-package aider
  ;TODO(fangzhen) :vc will be available in emacs 30, then we can replace package-vc-install with:
  ;:vc (:url "https://github.com/oantolin/tninja/aider.el")
  :config
  (setq aider-args nil)
  ;; Set a key binding for the transient menu
  (global-set-key (kbd "C-c a") 'aider-transient-menu))

(provide 'init-ai)
;;; init-ai.el ends here
