/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
var Kc = Kc || {};
Kc.Wizard = Kc.Wizard || {};
(function(namespace, $) {

    namespace.returnToFirstResultsPage = function() {
        $('.modal-body').find('a.first').click();
    };

    namespace.onShownDialogFixFocusAndKeyPress = function(inputSelector, buttonSelector) {
        // KC-1218 Use SOLR for person lookup
        $(inputSelector).closest('.modal').on('shown.bs.modal', function(e) {
            $(inputSelector).focus();
            $(inputSelector).keydown(function(event) {
                if (event.which == 13) {
                    //  event.preventDefault(); -- You suspect other stuff is happening. Let it happen.
                    $(buttonSelector).click();
                }
            });
        });
    };

    namespace.fixSearchLabel = function(e) {
        // This happens when anything in the entire containing div is clicked
        if (e.target.type == "radio") {
            if (e.target.value == "E") {
                jQuery("#q_label").html("Name or Username");
            } else if (e.target.value == "N") {
                jQuery("#q_label").html("Name");
            }
        }
    };

})(Kc.Wizard, jQuery);
