
# A fork from https://djangosnippets.org/snippets/2236/
# - Fixed broken layout
# - Added wrapper div

import math
from itertools import chain

from django import forms
from django.utils.encoding import force_text
from django.utils.html import conditional_escape
from django.utils.safestring import mark_safe

class ChoiceSeatWidget(forms.CheckboxSelectMultiple):
    def __init__(self, disable_list, col_list, num_list, columns=2, **kwargs):
        super(self.__class__, self).__init__(**kwargs)
        self.disable_list = disable_list
        self.columns = columns
        self.col_list = col_list
        self.num_list = num_list

    def render(self, name, value, attrs=None, choices=()):
        if value is None: value = []
        has_id = attrs and 'id' in attrs
        final_attrs = self.build_attrs(attrs, {'name':name})
        choices_enum = list(enumerate(chain(self.choices, choices)))
        #self.sdafasdf
        # This is the part that splits the choices into columns.
        # Slices vertically.  Could be changed to slice horizontally, etc.
        column_sizes = columnize(len(choices_enum), self.columns)
        columns = []
#         for column_size in self.columns:
#             columns.append(choices_enum[:column_size])
        
        
        for column_size in column_sizes:
            columns.append(choices_enum[:column_size])
            choices_enum = choices_enum[column_size:]
        output = []
        #self.asdfsd
        num = 0
        dis_num = 0
        #self.asdflkasdjf
        for column in columns:
            if(num == 0):
                output.append(u'<tr">')
                output.append(u'<td></td>') 
                for number in self.num_list:
                    output.append(u'<td>%s</td>' % number) 
                output.append(u'</tr>')
            output.append(u'<tr>')
            
            # Normalize to strings
            if(num==int(len(self.col_list)/2)):
                output.append(u'<tr><td>　</td></tr>')
                
            if(num<len(self.col_list)):
                output.append(u'<td>%s</td>' % self.col_list[num])
            
            num+=1
                
            str_values = set([force_text(v) for v in value])
            for i, (option_value, option_label) in column:
                # If an ID attribute was given, add a numeric index as a suffix,
                # so that the checkboxes don't all have the same ID attribute.
                if has_id:
                    if(self.disable_list[i]=='0'):
                        final_attrs = dict(final_attrs, id='%s_%s' % (
                            attrs['id'], i))
                        if 'disabled' in final_attrs:
                            del final_attrs['disabled']
                    else:
                        final_attrs = dict(final_attrs, id='%s_%s' % (
                            attrs['id'], i), disabled='')
                cb = forms.CheckboxInput(
                    final_attrs, check_test=lambda value: value in str_values)
                option_value = force_text(option_value)
                rendered_cb = cb.render(name, option_value)
                option_label = conditional_escape(force_text(option_label))
                output.append(u'<td>%s %s</td>' % (
                     rendered_cb, option_label))
            output.append(u'</tr>')
        

        wrapper = u'<table id="%s"><tbody>%s</tbody></table>' % \
            ("seatsBlock", u'\n'.join(output))


        
        return mark_safe(wrapper)


def columnize(items, columns):
    elts_per_column = []
    col_size = math.floor(items / columns)
    remain_size = items % columns
    for num in range(col_size):
        elts_per_column.append(columns)
    elts_per_column.append(remain_size)
    return elts_per_column
    
    

class ChoiceCheckboxTableList(forms.CheckboxSelectMultiple):
    def __init__(self, tr_list, th_list, **kwargs):
        super(self.__class__, self).__init__(**kwargs)
        self.tr_list = tr_list
        self.th_list = th_list
        self.columns=2
        
    def render(self, name, value, attrs=None, choices=()):
        if value is None: value = []
        has_id = attrs and 'id' in attrs
        final_attrs = self.build_attrs(attrs, {'name':name})
        assdf = self.choices
        assdsadf = choices
        asdf = chain(self.choices, choices)
        choices_enum = list(enumerate(zip(chain(self.choices, choices), self.tr_list)))
        # This is the part that splits the choices into columns.
        # Slices vertically.  Could be changed to slice horizontally, etc.
#         for column_size in self.columns:
#             columns.append(choices_enum[:column_size])
        
#         'id_seat',
#         'id_seat__seat_col',
#         'id_seat__seat_num',
#         'id_seat__seat_grade',
#         'id_seat__id_flight__id_aircraft__id_type', 
#         'id_seat__id_flight__depart_airport',
#         'id_seat__id_flight__arrive_airport',
#         'id_seat__id_flight__depart_time',
#         'id_seat__id_flight__arrive_time',
#         'id_seat__id_flight__economy_price',
#         'id_seat__id_flight__business_price'
        
        output = []
        
        if not len(choices_enum):
            output.append(u'<tr>')
            output.append(u'<th></th>')
            for th_name in self.th_list:
                output.append(u'<th>%s</th>' % th_name)  
            output.append(u'</tr>')
            output.append(u'<tr><td></td><td>항목이 없습니다</td></tr">')
                
        for idx, ((option_value, option_label), args) in choices_enum:
            if(idx == 0):
                output.append(u'<tr>')
                output.append(u'<th></th>')
                for th_name in self.th_list:
                    output.append(u'<th>%s</th>' % th_name)  
                output.append(u'</tr>')
                
            output.append(u'<tr>')
            # Normalize to strings
                
            str_values = set([force_text(v) for v in value])
           
            # If an ID attribute was given, add a numeric index as a suffix,
            # so that the checkboxes don't all have the same ID attribute.
            if has_id:
                final_attrs = dict(final_attrs, id='%s_%s' % (
                    attrs['id'], idx))
                    
            cb = forms.CheckboxInput(
                final_attrs, check_test=lambda value: value in str_values)
            option_value = force_text(option_value)
            rendered_cb = cb.render(name, option_value)
            option_label = conditional_escape(force_text(option_label))
            output.append(u'<td>%s %s</td>' % (
                 rendered_cb, option_label))
            
            for value in args:
                output.append(u'<td>%s</td>' % value)
            
            output.append(u'</tr>')     

        wrapper = u'<table id="%s"><tbody>%s</tbody></table>' % \
            ("seatsBlock", u'\n'.join(output))


        
        return mark_safe(wrapper)
