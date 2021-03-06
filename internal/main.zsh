#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function goenv::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_GOENV_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_GOENV_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_GOENV_PATH}"/internal/linux.zsh
      ;;
    esac
}

goenv::internal::main::factory
goenv::internal::goenv::load

if ! core::exists curl; then goenv::internal::curl::install; fi
if ! core::exists goenv; then goenv::internal::goenv::install; fi
