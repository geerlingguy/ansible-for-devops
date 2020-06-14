# blue Ansible test plugin definition.

def is_blue(string):
    blue_values = ['blue', '#0000ff', '#00f', 'rgb(0,0,255)']
    if string in blue_values:
      return True
    else:
      return False

class TestModule(object):
    ''' custom playbook jinja2 tests '''

    def tests(self):
        return dict(blue=is_blue)
