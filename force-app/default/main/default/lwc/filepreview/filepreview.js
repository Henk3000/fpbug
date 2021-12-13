import {LightningElement} from "lwc";
import {NavigationMixin} from "lightning/navigation";
import getImageId from "@salesforce/apex/FilePreviewHelper.getImageId";

export default class Filepreview extends NavigationMixin(LightningElement) {
	imageId;

	connectedCallback() {
		if (!this.imageId) {
			getImageId().then((result) => {
				this.imageId = result;
			});
		}
	}

	openPreview() {
		this[NavigationMixin.Navigate]({
			type: "standard__namedPage",
			attributes: {
				pageName: "filePreview"
			},
			state: {
				selectedRecordId: this.imageId
			}
		});
	}
}
