#!/bin/bash
ansible-test sanity --test pep8
ansible-test sanity --test validate-modules
