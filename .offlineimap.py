import subprocess


def get_pass(pass_name):
    return subprocess.check_output(['pass', pass_name])
