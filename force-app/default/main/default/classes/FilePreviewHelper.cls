public with sharing class FilePreviewHelper {
	@AuraEnabled
	public static String getImageId() {
		try {
			List<ContentVersion> cvs = [
				SELECT Id, ContentDocumentId
				FROM ContentVersion
				WHERE PathOnClient = 'sample.png'
				LIMIT 1
			];
			if (!cvs.isEmpty()) {
				return cvs[0].ContentDocumentId;
			}
			ContentVersion cv = new ContentVersion(
				ContentLocation = 'S',
				VersionData = EncodingUtil.base64Decode(
					'iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=='
				),
				Title = 'sample',
				PathOnClient = 'sample.png'
			);

			insert cv;
			return getImageId();
		} catch (Exception e) {
			throw new AuraHandledException(e.getMessage());
		}
	}
}
